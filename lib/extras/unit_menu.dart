import 'package:flutter/material.dart';
import 'unit.dart';

class UnitMenu extends StatefulWidget {
  // List of the chapters and their associated parameters. (chapterIndex can be derived from the index of our loop (+1))
  static const List<String> titles = [
    'Chapter 1:',
    'Chapter 2:',
    'Chapter 3:',
    'Chapter 4:',
    'Chapter 5:',
    'Chapter 6:',
    'Chapter 7:'
  ];
  static const List<String> subtitles = [
    'Introducing Ourselves',
    'Indefinite Articles',
    'Family Vocabulary',
    'Working With Numbers',
    'Learn About the Spanish Speaking World',
    'Practice -AR Verbs',
    'The Verb Ir'
  ];
  static const List<String> iconPaths = [
    'assets/icons/c1.png',
    'assets/icons/c2.png',
    'assets/icons/c3.png',
    'assets/icons/c4.png',
    'assets/icons/c5.png',
    'assets/icons/c6.png',
    'assets/icons/c7.png'
  ];
  static const List<int> numberOfActivitys = [5, 1, 1, 1, 1, 1, 1];
  static var activityInfo = [
    [null, null],
    [null, null, null],
    [null, null, null, null],
    [null, null, null, null, null],
    [null],
    [null],
    [null]
  ];

  /*
    We need to figure out a way to maintain the # of lessons, lesson data, etc. It's kind of convoluted.
   */
  const UnitMenu({Key? key}) : super(key: key);

  @override
  _UnitMenuState createState() => _UnitMenuState();
}

class _UnitMenuState extends State<UnitMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scaffold(
            appBar: AppBar(title: const Text('Table of Contents')),
            body: ListView(
              children: <Widget>[
                for (int i = 0; i < UnitMenu.titles.length; i++)
                  UnitButton(
                      title: UnitMenu.titles[i],
                      subtitle: UnitMenu.subtitles[i],
                      iconPath: UnitMenu.iconPaths[i],
                      numberOfActivitys: UnitMenu.numberOfActivitys[i],
                      activityInfo: UnitMenu.activityInfo[i],
                      unitIndex: i + 1)
              ],
            )),
      ),
    );
  }
}
