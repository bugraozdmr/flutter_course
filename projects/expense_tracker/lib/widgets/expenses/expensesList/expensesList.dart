import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses/expensesList/expenseItem.dart';
import 'package:flutter/material.dart';

class Expenseslist extends StatelessWidget {
  const Expenseslist({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Expenseitem(expenses[index]),
    );
  }
}
