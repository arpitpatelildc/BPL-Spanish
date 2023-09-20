import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// simple alert dialogue for app
class ShowCustomOkAlertDialogue extends StatelessWidget {
  final String? content;
  final Function()? ontap;
  final String? title;

  const ShowCustomOkAlertDialogue(
      {  this.content,  this.ontap,  this.title})
      : super();

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title!),
      content: Text(content!),
      actions: <Widget>[
        TextButton(
          child: Text("OK"),
          onPressed: ontap,
        ),
      ],
    );
  }
}
