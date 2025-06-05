import 'package:flutter/material.dart';

class Questionssummary extends StatelessWidget {
  const Questionssummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...summaryData.map((data) {
          final bool isCorrect = data['user_answer'] == data['correct_answer'];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Soru numarası
                CircleAvatar(
                  radius: 16,
                  backgroundColor: isCorrect ? Colors.green : Colors.red,
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),

                      Text(
                        'Senin cevabın: ${data['user_answer']}',
                        style: TextStyle(
                          color:
                              isCorrect ? Colors.greenAccent : Colors.redAccent,
                        ),
                      ),

                      // Doğru cevap
                      if (!isCorrect)
                        Text(
                          'Doğru cevap: ${data['correct_answer']}',
                          style: const TextStyle(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
