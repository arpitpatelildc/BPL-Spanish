import 'package:flutter/material.dart';
import 'package:sif_book/startup/globals.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final int right;
  final int length;
  final VoidCallback resetHandler;

  const Result({Key? key, required this.finalScore, required this.right, required this.length, required this.resetHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Final Score: ' '$right' ' out of ' '$finalScore',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: subtitleFontSize+1)
              ),
              Text(
                popupsJson[i]['Content'],
                style: TextStyle(fontSize: subtitleFontSize),
                textAlign: TextAlign.center
              ),
              ElevatedButton(
                onPressed: resetHandler,
                child: const Text(
                  "Start Over",
                ),
              )
            ],
    )));
  }
}
