import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses/expensesList/expenseItem.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        final expense = expenses[index];
        // 3 parmak ile kaydır sola doğru
        return Dismissible(
          key: ValueKey(expense),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Theme.of(context).colorScheme.error,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(Icons.delete, color: Colors.white, size: 30),
          ),
          onDismissed: (direction) {
            final removedExpense = expense;
            final removedIndex = expenses.indexOf(expense);

            onRemoveExpense(removedExpense);

            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Expense deleted.'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    expenses.insert(removedIndex, removedExpense);
                    (context as Element).markNeedsBuild();
                  },
                ),
                duration: const Duration(seconds: 3),
              ),
            );
          },

          child: Expenseitem(expense),
        );
      },
    );
  }
}
