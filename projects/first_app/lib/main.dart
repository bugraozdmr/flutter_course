import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

/**
 * 
 * Flutter Widget : https://docs.flutter.dev/ui/widgets
 */

void main() {
  /*
  runApp wants us to give widget so that we did. (?)
  thanks to const device memory will be used better. Define once use all the time.
  */
  /*
  runApp(const MaterialApp(home: Text(
    "Hello World"
  )));
  */

  runApp(
    // buralara const koyarsan optimize olur ... // sürekli sürekli oluşmazlar 1 kere oluşur
    // constlar önemli
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 47, 5, 120),
        body: Center(
          child: GradientContainer(
            colors: [
              Color(0xFF11998E), // Deniz yeşili (Tiffany Green)
              Color(0xFF38EF7D), // Açık yeşil (Emerald)
            ],
          ),
        ),
      ),
    ),
  );
}
