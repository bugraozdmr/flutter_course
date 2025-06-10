import 'package:expense_tracker/models/expense.dart';
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
            child: const NewExpense(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(child: Expenseslist(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
