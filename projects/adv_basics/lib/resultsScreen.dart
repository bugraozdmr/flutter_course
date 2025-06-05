import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class Resultsscreen extends StatelessWidget {
  const Resultsscreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final VoidCallback onRestart;

  // getter // gets a class property and outputs it
  // List<Map<String, Object>> get getSummaryData -- de olabilirdi
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final int totalQuestions = summaryData.length;
    final int correctAnswers =
        summaryData
            .where((data) => data['user_answer'] == data['correct_answer'])
            .length;

    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Başlık
              Text(
                'Tebrikler!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent[100],
                  shadows: const [
                    Shadow(
                      blurRadius: 8,
                      color: Colors.black54,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Sonuç metni
              Text(
                '$totalQuestions sorudan $correctAnswers tanesini doğru cevapladın',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 30),

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[700],
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children:
                          summaryData.map((data) {
                            final bool isCorrect =
                                data['user_answer'] == data['correct_answer'];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor:
                                        isCorrect
                                            ? Colors.greenAccent[400]
                                            : Colors.redAccent[400],
                                    child: Text(
                                      ((data['question_index'] as int) + 1)
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data['question'] as String,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        RichText(
                                          text: TextSpan(
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white70,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'Senin cevabın: ',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    data['user_answer']
                                                        as String,
                                                style: TextStyle(
                                                  color:
                                                      isCorrect
                                                          ? Colors
                                                              .greenAccent[200]
                                                          : Colors
                                                              .redAccent[200],
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (!isCorrect) ...[
                                          const SizedBox(height: 2),
                                          RichText(
                                            text: TextSpan(
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white70,
                                              ),
                                              children: [
                                                const TextSpan(
                                                  text: 'Doğru cevap: ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      data['correct_answer']
                                                          as String,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.greenAccent,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purpleAccent,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 32,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                child: const Text(
                  'Yeniden Dene',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
