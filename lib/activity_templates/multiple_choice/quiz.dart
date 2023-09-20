import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final int index;
  final dynamic questionJSON;
  final Function findAnswer;

  const Quiz(
      {Key? key,
      required this.questionJSON,
      required this.index,
      required this.findAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              height: 100,
              child: Image.asset(questionJSON[index]['path'])
            ),
            Question(question: questionJSON[index]['question']),
            ...(questionJSON[index]['answers'] as List<dynamic>).map((answer) {
            return Answer(answer: answer['text'] as String, stateHandler:
              () => findAnswer(answer['score'] as int, context));
        }).toList()
      ]),
    ),
    );
  }
}
