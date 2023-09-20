import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sif_book/startup/globals.dart';
import 'quiz.dart';
import 'result.dart';
import 'package:just_audio/just_audio.dart';

class MultipleChoiceUI extends StatefulWidget {
  final dynamic questions;

  const MultipleChoiceUI({Key? key, required this.questions}) : super(key: key);

  @override
  _MultipleChoiceUIState createState() => _MultipleChoiceUIState();
}

class _MultipleChoiceUIState extends State<MultipleChoiceUI> {
  // Index the list of widget.questions, and keep track of the player's score.
  int _index = 0;
  int _totalScore = 0;
  int _totalClicks = 0;
  int popup = i;
  late AudioPlayer player;

  @override
  void initState(){
    super.initState();
    player = AudioPlayer();
  }

  void _startOver() {
    setState(() {
      _index = 0;
      _totalScore = 0;
      _totalClicks = 0;
      i = popup; 
    });
  }

  void _findAnswer(int score, BuildContext context) {
    _totalClicks++;
    _totalScore += score;
    // If the score is 1, we can move on to the next question.
    // If it is 0, we will want to notify the user and have them guess again.
    if (score == 0) {
      player.setAsset("assets/audio/wrong.wav");
      Fluttertoast.showToast(
          msg: "Oops- that's not correct. Please try again.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          webBgColor: "linear-gradient(to right, #b71c1c, #ef9a9a)",
          textColor: Colors.white,
          fontSize: subtitleFontSize);
    } else {
      player.setAsset("assets/audio/correct.wav");
      Fluttertoast.showToast(
          msg: "Great job! That's correct!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          webBgColor: "linear-gradient(to right, #2e7d32, #81c784)",
          textColor: Colors.white,
          fontSize: subtitleFontSize);
      setState(() {
        // Make sure the index doesn't go out of bounds.
        _index += 1;
        if (_index > widget.questions.length - 1) {
          if (_totalScore - (_totalClicks-_totalScore) >= .8*widget.questions.length) {
            if (i == 9 || i == 16 || i == 25 || i == 34 || i == 39) {
              if (currentUnit == 1 && i == 9) {
                currentUnit = 2;
              } else if (currentUnit == 2 && i == 16) {
                currentUnit = 3;
              } else if (currentUnit == 3 && i == 25) {
                currentUnit = 4;
              } else if (currentUnit == 4 && i == 34) {
                currentUnit = 5;
              } else if (currentUnit == 5 && i == 39) {
                if (!unit5SerComplete) {
                  unit5SerComplete = true;
                }
              }
              i = 40;
            } else {
              i = 42;
            }
          }else{
            i = 41;
          }
        }
      });
    }
    player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
            color: Colors.blueGrey.shade50,
            child: Image.asset(
              "assets/images/bpl_Logo.png",
              height: 65,
              alignment: Alignment.bottomCenter,
            )),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showMaterialDialog(context, false),
          label: Text('?', style: TextStyle(fontSize: titleFontSize)),
          backgroundColor: sifBlue,
        ),
        appBar: AppBar(
          title: Text('Multiple Choice',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: headerFontSize)),
          toolbarHeight: headerHeight,
        ),
        body: Center(
          child: (_index < widget.questions.length
              ? Quiz(
                  index: _index,
                  questionJSON: widget.questions,
                  findAnswer: _findAnswer)
              : Result(finalScore: _totalScore, right: _totalScore-(_totalClicks-_totalScore), length: widget.questions.length, resetHandler: _startOver)),
        ));
  }
}
