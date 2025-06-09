import 'dart:math';

import 'package:expense_tracker/helpers/helpers.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenseitem extends StatelessWidget {
  // positional argument // no need required
  const Expenseitem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kategori ikon (solda)
            CircleAvatar(
              radius: 24,
              backgroundColor: getCategoryColor(
                expense.category,
              ).withOpacity(0.2),
              child: Icon(
                getCategoryIcon(expense.category),
                color: getCategoryColor(expense.category),
              ),
            ),
            const SizedBox(width: 16),

            // Ana bilgi bloğu
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Başlık
                  Text(
                    expense.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Kategori ismi + ikon
                  Row(
                    children: [
                      Icon(Icons.label, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        expense.category.name,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Tarih
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        "${expense.date.toLocal().toString().split(' ')[0]}",
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Tutar
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$${expense.amount.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
