import 'package:adv_basics/QuestionsScreen.dart';
import 'package:adv_basics/StartScreen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
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

  // switchScreen: Ekranı StartScreen'den QuestionsScreen'e değiştirmek için çağrılır
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen();
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
          child: screenWidget, // Aktif ekran burada gösterilir
        ),
      ),
    );
  }
}
