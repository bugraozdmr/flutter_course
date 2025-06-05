import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  // value almayan ve deger donmeyen bir fonk startQuiz
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // min alan alacak gereken yükseklik yani
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(
              150,
              255,
              255,
              255,
            ), // transparent image
          ),
          /*Opacity(
            opacity: 0.6,
            child: Image.asset('assets/images/quiz-logo.png', width: 300),
          ),*/
          const SizedBox(height: 80),
          Text(
            'Abur Cubur Canavarı Şeymayı ne kadar iyi tanıyorsun',
            style: GoogleFonts.raleway(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
