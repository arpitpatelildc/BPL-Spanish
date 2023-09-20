import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sif_book/startup/globals.dart';
import 'activity_menu.dart';

class UnitButton extends StatefulWidget {
  // Variables that we will pass in when constructing each button.
  final dynamic activityInfo;
  final int numberOfActivitys;
  final int unitIndex;
  final String iconPath;
  final String title;
  final String subtitle;
  const UnitButton({Key? key, required this.title, required this.subtitle, required this.iconPath, required this.unitIndex, required this.numberOfActivitys, required this.activityInfo}) : super(key: key);

  @override
  _UnitButtonState createState() => _UnitButtonState();
}

class _UnitButtonState extends State<UnitButton> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(widget.iconPath)),
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
      trailing: (currentUnit >= widget.unitIndex) ? unlocked  : locked,
      selected: (currentUnit >= widget.unitIndex) ? true : false,
      enabled: (currentUnit >= widget.unitIndex) ? true : false,
      onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ActivityMenu(numberOfActivitys: widget.numberOfActivitys, activityJSON: widget.activityInfo))).then(onGoBack);
    });
  }
  FutureOr onGoBack(dynamic val) {
    setState(() {});
  }
}