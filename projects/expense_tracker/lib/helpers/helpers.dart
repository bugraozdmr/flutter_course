import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

Color getCategoryColor(Category category) {
  switch (category) {
    case Category.food:
      return Colors.orange;
    case Category.travel:
      return Colors.blue;
    case Category.leisure:
      return Colors.purple;
    case Category.work:
      return Colors.green;
  }
}

IconData getCategoryIcon(Category category) {
  switch (category) {
    case Category.food:
      return Icons.fastfood;
    case Category.travel:
      return Icons.flight;
    case Category.leisure:
      return Icons.sports_esports;
    case Category.work:
      return Icons.work;
  }
}
