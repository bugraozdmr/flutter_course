import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expensesList/expensesList.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(child: Expenseslist(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
