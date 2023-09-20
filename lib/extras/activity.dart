import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sif_book/startup/globals.dart';



class ActivityButton extends StatefulWidget {
  // Similar to chapter.dart, variables that we will pass in when constructing each button.
  final int activityIndex;
  final String title;
  final String subtitle;
  // activityInfo is a LIST of activity JSON
  final dynamic activityInfo;

  const ActivityButton({Key? key, required this.activityIndex, required this.title, required this.subtitle, required this.activityInfo}) : super(key: key);

  @override
  _ActivityButtonState createState() => _ActivityButtonState();
}

class _ActivityButtonState extends State<ActivityButton> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(widget.title),
        subtitle: Text(widget.subtitle),
        trailing: unlocked,
        selected: true,
        enabled: true,
        onTap: () {
          // Navigate to Flashcard
          // Navigator.push(context, MaterialPageRoute(builder: (context) => FlashcardUI(flashcardJSON: widget.activityInfo[widget.activityIndex-1], activityIndex: widget.activityIndex))).then(onGoBack);
          // Navigate to Conversation
          // Navigator.push(context, MaterialPageRoute(builder: (context) => ConversationUI(transcript: transcript1, path: '', activityIndex: widget.activityIndex))).then(onGoBack);
          // Navigate to M.C.
          // Navigator.push(context, MaterialPageRoute(builder: (context) => MultipleChoiceUI(questions: quiz1)));
          // Navigate to Neuroscience Paragraphs.
          // Navigator.push(context, MaterialPageRoute(builder: (context) => NeuroscienceUI(pageText: exerciseTip)));
        });
  }
  FutureOr onGoBack(dynamic val) {
    setState(() {});
}
}
