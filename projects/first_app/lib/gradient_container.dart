import 'dart:math';

import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

// Alignment? optionalAlignment;
/**
final: Bir kez atanır, sonra değiştirilemez.
const: Derleme zamanında sabittir, sadece sabit (const) değer alabilir. Heap yerine compile-time bellekte tutulur.
 */
var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

// stateless = değişmez \ stateful = değişir

class GradientContainer extends StatelessWidget {
  // Bu widget oluşturulurken verilen key değerini al ve üst sınıf olan StatelessWidget'e ilet. Her yerde var
  // const GradientContainer({key}) : super(key: key);
  const GradientContainer({super.key, required this.colors});

  // GradientContainer.testMe() : do something;

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        // artık bu değerler değişebileceğinden var değerleri const olamaz bunlar
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      // child: StyledText("Hello Y'all"),
      child: Center(
        child: DiceRoller(),
      )
    );
  }
}
