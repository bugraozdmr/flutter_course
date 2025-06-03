import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  StyledText(this.text,{super.key});

  final String text;

  // artık const olamaz
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 24),
    );
  }
}
