import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense expense) onAddExpense;

  const NewExpense({super.key, required this.onAddExpense});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1),
      lastDate: now,
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _submitExpenseData() {
    final enteredTitle = _titleController.text.trim();
    final enteredAmount = double.tryParse(_amountController.text.trim());
    final isAmountValid = enteredAmount != null && enteredAmount > 0;

    if (enteredTitle.isEmpty ||
        !isAmountValid ||
        _selectedDate == null ||
        _selectedCategory == null) {
      showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: const Text('Invalid Input'),
              content: const Text(
                'Please ensure:\n\n- Title is not empty\n- Amount is a positive number\n- Date and Category are selected',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('Okay'),
                ),
              ],
            ),
      );
      return;
    }

    final newExpense = Expense(
      title: enteredTitle,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory!,
    );

    widget.onAddExpense(newExpense);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    final screenWidth = MediaQuery.of(context).size.width;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: InputDecoration(
            labelText: 'Title',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.grey.shade200,
          ),
        ),

        const SizedBox(height: 20),

        isLandscape
            ? Row(
              children: [
                Expanded(child: _buildAmountField()),
                const SizedBox(width: 16),
                Expanded(child: _buildDatePickerButton()),
              ],
            )
            : Column(
              children: [
                _buildAmountField(),
                const SizedBox(height: 16),
                _buildDatePickerButton(),
              ],
            ),

        const SizedBox(height: 20),

        // Category Dropdown
        DropdownButtonFormField<Category>(
          value: _selectedCategory,
          decoration: InputDecoration(
            labelText: 'Category',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.grey.shade200,
          ),
          items:
              Category.values.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(
                    category.name[0].toUpperCase() + category.name.substring(1),
                  ),
                );
              }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedCategory = value;
            });
          },
        ),

        const SizedBox(height: 30),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: _submitExpenseData,
              child: const Text('Save Expense'),
            ),
          ],
        ),
      ],
    );

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 16,
          bottom: keyboardSpace + 16,
        ),
        child:
            screenWidth > 600
                ? Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: content,
                  ),
                )
                : content,
      ),
    );
  }

  Widget _buildAmountField() {
    return TextField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Amount',
        prefixText: '\$ ',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
    );
  }

  Widget _buildDatePickerButton() {
    return OutlinedButton(
      onPressed: _presentDatePicker,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              _selectedDate == null
                  ? 'Choose Date'
                  : DateFormat.yMd().format(_selectedDate!),
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.calendar_today, size: 20),
        ],
      ),
    );
  }
  /**
   * Küçük ekranlarda içerikler dikey olarak sıralanır.
    Tablet ya da yatay modda içerikler daha yatay yapıda gösterilir.
    ConstrainedBox sayesinde büyük ekranlarda içerik çok genişlemez (maks. 600px gibi tutulur).
   */

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}
