import 'package:adv_basics/QuestionsScreen.dart';
import 'package:adv_basics/StartScreen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/resultsScreen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  // Uygulamada aktif olan ekranı (Widget) tutar
  var activeScreen = 'start-screen';

  // initState: Widget oluşturulduğunda bir kere çalışır. İlk aktif ekranı burada belirliyoruz.
  /*@override
  void initState() {
    activeScreen = StartScreen(
      switchScreen,
    ); // switchScreen fonksiyonunu StartScreen'e iletiyoruz
    super.initState();
  }*/

  void switchScreen() {
    setState(() {
      // selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = Resultsscreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz, // burada restart fonksiyonunu veriyoruz
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepPurpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
