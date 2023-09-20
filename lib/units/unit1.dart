import 'dart:async';
import 'package:sif_book/activity_templates/dialogue/dialogue_ui.dart';
import 'package:sif_book/activity_templates/multiple_choice/multiplechoice_ui.dart';
import 'package:sif_book/startup/globals.dart';
import 'package:flutter/material.dart';
import 'package:sif_book/activity_templates/flashcards/flashcard_ui.dart';
import 'package:sif_book/activity_templates/flashcards/alphabet_flashcard.dart';
import 'package:sif_book/units/neurosciencepage.dart';
import 'package:sif_book/activity_templates/overviews/unit1overview.dart';

class Unit1Activitys extends StatefulWidget {
  const Unit1Activitys({Key? key}) : super(key: key);

  @override
  State<Unit1Activitys> createState() => _Unit1ActivitysState();
}

class _Unit1ActivitysState extends State<Unit1Activitys> {
  @override
// The widget being built here is the entire screen, and the body: ListWidget() creates an inner widget that is the list of Units.
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Unidad 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: headerFontSize)),
              toolbarHeight: headerHeight,
            ),
            body: Scrollbar(
              isAlwaysShown: true,
              child: ListWidget(),
              thickness: 10,
              radius: Radius.circular(5),
            )),
      ),
    );
  }
}
/*
    A lot of the code below here could be refactored or put into a loop to be a lot less repetitive, but it was more of a working test.
      - Lists of Names, icons, etc could be used and then we can just make the buttons in a loop or something.
 */

class ListWidget extends StatefulWidget {
  ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final List<String> titles = <String>[
    'Tarjetas del Alfabeto',
    'Vocabulario de la Unidad',
    'Artículos Definidos',
    'Plurales',
    'Adjectivos',
    'Conjugaciones del Verbo Ser',
    'Regla 1 de ser',
    'Palabras y Frases Importantes',
    'Diálogo',
    'Resumen de la Unidad',
    'Práctica de la Unidad Completa'
  ];
  final List<String> subTitles = <String>[
    '(Alphabet Flashcards)',
    '(Alphabet Flashcards)',
    '(Definite Articles)',
    '(Plurals)',
    '(Ajectives)',
    '(Verb to be (Ser) conjugations)',
    '(Ser Rule 1)',
    '(Important Words and Phrases)',
    '(Dialogue)',
    '(Unit Overview)',
    '(Full Unit Practice)'
  ];

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
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 30);
          },
          padding: const EdgeInsets.all(8),

          itemCount: titles.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: ListTile(
                title: Text(
                  titles[index],
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: titleFontSize, color: sifGreen),
                ),
                subtitle: Text(
                  subTitles[index],
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
                ),
                visualDensity: VisualDensity(vertical: -4),
                trailing: unlocked,
                selected: true,
                enabled: true,
                onTap: () {
                  if (index == 0) {
                    i = 0;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AlphabetFlashcard(
                                flashcardJSON: Unit1_1r,
                                activityIndex: 1))).then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 1) {
                    i = 1;
                    // Navigates to a temporary Activity page.
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlashcardUI(
                                flashcardJSON: Unit1_2r,
                                // Declare which global flashcardResponse is being used for the activity
                                activityIndex: 1))).then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 2) {
                    i = 2;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit1_3r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 3) {
                    i = 3;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit1_4r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 4) {
                    i = 4;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit1_5r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 5) {
                    i = 5;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit1_6r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 6) {
                    i = 6;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit1_7r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 7) {
                    i = 7;
                    // Navigates to a temporary Activity page.
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlashcardUI(
                                flashcardJSON: Unit1_8r,
                                // Declare which global flashcardResponse is being used for the activity
                                activityIndex: 1))).then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 8) {
                    i = 8;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DialogueUI(
                                transcript: Unit1_9r,
                                path: 'assets/audio/ch1-dialogue.mp3',
                                activityIndex: 8))).then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 9) {
            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Unit1Overview()))
                          .then(onGoBack);
            showMaterialDialog(context, true);
            } else {
                      i = 9;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MultipleChoiceUI(questions: Unit1_10r)))
                          .then(onGoBack);
                      showMaterialDialog(context, true);
                    }
                },
              ),
            );
          }),
      // ListView(
      //   children: <Widget>[
      //     SizedBox(
      //       height: 25,),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text("Tarjetas del Alfabeto",
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Alphabet Flashcards)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         onTap: () {
      //           i = 0;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => AlphabetFlashcard(
      //                       flashcardJSON: Unit1_1r,
      //                       activityIndex: 1))).then(onGoBack);
      //           showMaterialDialog(context, true);
      //           // Navigates to a temporary Activity page.
      //           // Navigator.push(
      //           //         context,
      //           //         MaterialPageRoute(
      //           //             builder: (context) =>
      //           //                  NeuroscienceUI(pageText: exerciseTip)))
      //           //     .then(onGoBack);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text("Vocabulario de la Unidad",
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Unit Vocabulary)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         onTap: () {
      //           i = 1;
      //           // Navigates to a temporary Activity page.
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => FlashcardUI(
      //                       flashcardJSON: Unit1_2r, // Declare which global flashcardResponse is being used for the activity
      //                       activityIndex: 1))).then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text("Artículos Definidos",
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Definite Articles)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         onTap: () {
      //           // Navigates to a temporary Activity page.
      //           i=2;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => MultipleChoiceUI(
      //                       questions: Unit1_3r))).then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text('Plurales',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Plurals)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         onTap: () {
      //           i=3;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => MultipleChoiceUI(
      //                       questions: Unit1_4r))).then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text('Adjectivos',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Ajectives)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         onTap: () {
      //           i=4;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => MultipleChoiceUI(
      //                       questions: Unit1_5r))).then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text('Conjugaciones del Verbo Ser',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Verb to be (Ser) conjugations)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         onTap: () {
      //           i=5;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       MultipleChoiceUI(questions: Unit1_6r)))
      //               .then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text('Regla 1 de ser',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Ser Rule 1)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         onTap: () {
      //           i=6;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       MultipleChoiceUI(questions: Unit1_7r)))
      //               .then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text('Palabras y Frases Importantes',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Important Words and Phrases)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         onTap: () {
      //           i = 7;
      //           // Navigates to a temporary Activity page.
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => FlashcardUI(
      //                       flashcardJSON: Unit1_8r, // Declare which global flashcardResponse is being used for the activity
      //                       activityIndex: 1))).then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text('Diálogo',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Dialogue)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         onTap: () {
      //           i=8;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => DialogueUI(
      //                       transcript: Unit1_9r,
      //                       path: 'assets/audio/ch1-dialogue.mp3',
      //                       activityIndex: 8))).then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text('Resumen de la Unidad',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Unit Overview)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => Unit1Overview()))
      //               .then(onGoBack);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text('Práctica de la Unidad Completa',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Full Unit Practice)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         onTap: () {
      //           i=9;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       MultipleChoiceUI(questions: Unit1_10r)))
      //               .then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }
}
