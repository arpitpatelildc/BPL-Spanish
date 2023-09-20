import 'package:flutter/material.dart';
import 'package:sif_book/startup/units.dart';
import 'package:sif_book/startup/globals.dart';

class TestActivity extends StatefulWidget {
  const TestActivity({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TestActivity> createState() => _TestActivityState();
}

class _TestActivityState extends State<TestActivity> {
  int _counter = 0;

  void _incrementCounter() {
    // setState basically says "Some info has changed, re-draw / calculate what is being displayed on the user's screen"
    setState(() {
      _counter++;
      // Some logic to 'pass' the activity.
      if (_counter >= 5){
        _counter = 0;
        // If the activity # matches the target activity #, they get credit for completing the activity. (will need a way to check chapter, but IDK how for now).
        // if (widget.title.contains(lessonsComplete.toString())) {
        //   lessonsComplete += 1;
        // }
        // If lessonsComplete == 7, we need to: reset counter to 1, and increment chapters completed.
        // if (lessonsComplete == 8){
        //   lessonsComplete = 1;
        //   chapterComplete += 1;
        //   // Send them back to the Table to contents, to avoid any weird stuff with Lesson screen being old + still counting towards the new chapter.
        //   // Could add some type of "Nice work!" pop up after completing a chapter, the immediate navigation back to the ToC is kind of jarring.
        //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Chapters()));
        // }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This is RERAN everytime we call setState() above.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Press the button 5 times to 'unlock' the next activity:",
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}