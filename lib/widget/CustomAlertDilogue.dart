import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Customealert dialogue for android and ios different
Future<Future> showCustomAlertDialog(
    { final BuildContext? context,
     final String? title,
     final String? content,
     final String? cancelActionText,
     final String? defaultActionText,
     final Color btnCancelColor = Colors.blue,
     final Function()? ontap}) async {

  // todo : showDialog for ios
  return showCupertinoDialog(
    context: context!,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title!),
      content: Text(content!),
      actions: <Widget>[
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(cancelActionText),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        CupertinoDialogAction(
          child:
              Text(defaultActionText!, style: TextStyle(color: btnCancelColor)),
          onPressed: ontap,
        ),
      ],
    ),
  );
}
