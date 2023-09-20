import 'package:flutter/material.dart';
import 'activity.dart';

class ActivityMenu extends StatefulWidget {
  // # of activitys, and activityJSON is a LIST of valid JSON files to pull into activitys.
  final int numberOfActivitys;
  final dynamic activityJSON;

  const ActivityMenu(
      {Key? key, required this.numberOfActivitys, required this.activityJSON})
      : super(key: key);

  @override
  _ActivityMenuState createState() => _ActivityMenuState();
}

class _ActivityMenuState extends State<ActivityMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scaffold(
            appBar: AppBar(title: const Text('Activity Selection')),
            body: ListView(
              children: <Widget>[
                for (int i = 0; i < widget.numberOfActivitys; i++)
                  ActivityButton(
                      subtitle: 'Activity #${i + 1}',
                      title: 'Activity #${i + 1}',
                      activityInfo: widget.activityJSON,
                      activityIndex: i + 1)
              ],
            )),
      ),
    );
  }
}
