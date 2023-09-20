import 'package:flutter/material.dart';
import 'package:sif_book/startup/globals.dart';

class Flashcard extends StatelessWidget {
  final String text;
  const Flashcard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: sifBlue,
      child: Center(
          child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: headerFontSize, color: Colors.white)))
    );
  }
}
