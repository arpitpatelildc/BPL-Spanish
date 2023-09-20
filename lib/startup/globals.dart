import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Flags for Chapters/Lessons completed
int currentUnit = 5;
bool unit5SerComplete = true;

// JSON data
late dynamic popupsJson;
// Chapter 1
late dynamic Unit1_1r;
late dynamic Unit1_2r;
late dynamic Unit1_3r;
late dynamic Unit1_4r;
late dynamic Unit1_5r;
late dynamic Unit1_6r;
late dynamic Unit1_7r;
late dynamic Unit1_8r;
late dynamic Unit1_9r;
late dynamic Unit1_10r;

// Chapter 2
late dynamic Unit2_1r;
late dynamic Unit2_2r;
late dynamic Unit2_3r;
late dynamic Unit2_4r;
late dynamic Unit2_5r;
late dynamic Unit2_6r;
late dynamic Unit2_7r;

// Chapter 3 JSON data
late dynamic Unit3_1r;
late dynamic Unit3_2r;
late dynamic Unit3_3r;
late dynamic Unit3_4r;
late dynamic Unit3_5r;
late dynamic Unit3_6r;
late dynamic Unit3_7r;
late dynamic Unit3_8r;
late dynamic Unit3_9r;

// Chapter 4 JSON data
late dynamic Unit4_1r;
late dynamic Unit4_2ar;
late dynamic Unit4_2br;
late dynamic Unit4_3r;
late dynamic Unit4_4r;
late dynamic Unit4_5r;
late dynamic Unit4_6ar;
late dynamic Unit4_6br;
late dynamic Unit4_7r;

// Chapter 5 JSON data
late dynamic Unit5_1r;
late dynamic Unit5_2r;
late dynamic Unit5_3r;
late dynamic Unit5_4r;
late dynamic Unit5_5r;

// Icons for locked/unlocked items on navigation menu
const Icon locked = Icon(Icons.lock, color: sifOrange);
const Icon unlocked = Icon(Icons.lock_open_sharp, color: sifOrange);

// SIF Language School 3 colors & corresponding gradient/swatch
const Map<int, Color> blueSwatch = {
  50: Color.fromRGBO(11, 83, 148, .1),
  100: Color.fromRGBO(11, 83, 148, .2),
  200: Color.fromRGBO(11, 83, 148, .3),
  300: Color.fromRGBO(11, 83, 148, .4),
  400: Color.fromRGBO(11, 83, 148, .5),
  500: Color.fromRGBO(11, 83, 148, .6),
  600: Color.fromRGBO(11, 83, 148, .7),
  700: Color.fromRGBO(11, 83, 148, .8),
  800: Color.fromRGBO(11, 83, 148, .9),
  900: Color.fromRGBO(11, 83, 148, 1),
};

const Map<int, Color> greenSwatch = {
  50: Color.fromRGBO(56, 118, 29, .1),
  100: Color.fromRGBO(56, 118, 29, .2),
  200: Color.fromRGBO(56, 118, 29, .3),
  300: Color.fromRGBO(56, 118, 29, .4),
  400: Color.fromRGBO(56, 118, 29, .5),
  500: Color.fromRGBO(56, 118, 29, .6),
  600: Color.fromRGBO(56, 118, 29, .7),
  700: Color.fromRGBO(56, 118, 29, .8),
  800: Color.fromRGBO(56, 118, 29, .9),
  900: Color.fromRGBO(56, 118, 29, 1),
};

const Map<int, Color> orangeSwatch = {
  50: Color.fromRGBO(244, 115, 33, .1),
  100: Color.fromRGBO(244, 115, 33, .2),
  200: Color.fromRGBO(244, 115, 33, .3),
  300: Color.fromRGBO(244, 115, 33, .4),
  400: Color.fromRGBO(244, 115, 33, .5),
  500: Color.fromRGBO(244, 115, 33, .6),
  600: Color.fromRGBO(244, 115, 33, .7),
  700: Color.fromRGBO(244, 115, 33, .8),
  800: Color.fromRGBO(244, 115, 33, .9),
  900: Color.fromRGBO(244, 115, 33, 1),
};

// MaterialColor is the object used to color stuff inside the app, and these objects require a "gradient" which is the Swatch.
const MaterialColor sifBlue = MaterialColor(0xFF1c3c74, blueSwatch);
const MaterialColor sifGreen = MaterialColor(0xFF096939, greenSwatch);
const MaterialColor sifOrange = MaterialColor(0xFFf36c24, orangeSwatch);

// Global variable that keeps track of what activity we're on,
// so that the popups display the correct information
int i = 0;

// Font Size global variables
double headerFontSize = 40.0;
double headerHeight = 85.0;
double titleFontSize = 25.0;
double subtitleFontSize = 19.0;
double boxHeight = 120.0;

// Font size adjustment function
void fontSizeAdjust(bool zoomIn) {
  if (zoomIn && titleFontSize < 35.0) {
    headerFontSize = 10 / 9 * headerFontSize;
    headerHeight = 10 / 9 * headerHeight;
    titleFontSize = 10 / 9 * titleFontSize;
    subtitleFontSize = 10 / 9 * subtitleFontSize;
    boxHeight = 10 / 9 * boxHeight + 4;
  } else if (!zoomIn && titleFontSize > 18.0) {
    headerFontSize = 9 / 10 * headerFontSize;
    headerHeight = 9 / 10 * headerHeight;
    titleFontSize = 9 / 10 * titleFontSize;
    subtitleFontSize = 9 / 10 * subtitleFontSize;
    boxHeight = 9 / 10 * (boxHeight - 4);
  }
}

void showMaterialDialog(BuildContext context, bool start) async {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(popupsJson[i]['Title'], style: TextStyle(fontSize: subtitleFontSize)),
          content: Scrollbar(
            isAlwaysShown: true,
            child: SingleChildScrollView(child: Text(popupsJson[i]['Content'], style: TextStyle(fontSize: subtitleFontSize))),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  _dismissDialog(context);
                },
                child: (start) ? Text('Start Activity') : Text('Close')),
          ],
        );
      });
}

_dismissDialog(BuildContext context) {
  Navigator.pop(context);
}
