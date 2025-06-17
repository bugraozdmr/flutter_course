import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses/expensesList/expensesList.dart';
import 'package:expense_tracker/widgets/expenses/newExpsense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Course Material',
      amount: 199.20,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Lahmacun',
      amount: 87,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Sata to usb transporter box',
      amount: 210,
      date: DateTime.now(),
      category: Category.work,
    ),
  ];

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder:
          (ctx) => Padding(
            padding: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 16,
            ),
            child: NewExpense(onAddExpense: _addExpense),
          ),
    );
  }

  // safe area / safearea -- mesela kamera üstüne element gelmemesini sağlar
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // print(MediaQuery.of(context).size.height);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 4,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text(
          'Expense Tracker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            tooltip: 'Add new expense',
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body:
          width < 600
              ? Column(
                children: [
                  Chart(expenses: _registeredExpenses),
                  Expanded(
                    child: ExpensesList(
                      expenses: _registeredExpenses,
                      onRemoveExpense: _removeExpense,
                    ),
                  ),
                ],
              )
              : Row(
                children: [
                  Expanded(child: Chart(expenses: _registeredExpenses)),
                  Expanded(
                    child: ExpensesList(
                      expenses: _registeredExpenses,
                      onRemoveExpense: _removeExpense,
                    ),
                  ),
                ],
              ),
    );
  }
}
