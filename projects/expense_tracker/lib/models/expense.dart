// uuid
// flutter pub add uuid

import 'package:uuid/uuid.dart';

const uuid = Uuid();

// enum
enum Category { food, travel, leisure, work }

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  final Category category;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses =
          allExpenses.where((expense) => expense.category == category).toList();

  double get totalExpenses {
    return expenses.fold(0, (sum, item) => sum + item.amount);
  }
}
