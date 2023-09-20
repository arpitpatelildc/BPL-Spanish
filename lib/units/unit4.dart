import 'dart:async';
import 'package:sif_book/activity_templates/dialogue/dialogue_ui.dart';
import 'package:sif_book/activity_templates/multiple_choice/multiplechoice_ui.dart';
import 'package:sif_book/startup/globals.dart';
import 'package:flutter/material.dart';
import 'package:sif_book/activity_templates/flashcards/flashcard_ui.dart';
import 'package:sif_book/units/neurosciencepage.dart';
import 'package:sif_book/activity_templates/overviews/unit4overview.dart';

class Unit4Activitys extends StatefulWidget {
  const Unit4Activitys({Key? key}) : super(key: key);

  @override
  State<Unit4Activitys> createState() => _Unit4ActivitysState();
}

class _Unit4ActivitysState extends State<Unit4Activitys> {
  @override
// The widget being built here is the entire screen, and the body: ListWidget() creates an inner widget that is the list of Units.
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Unidad 4',
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
    'Vocabulario de la Unidad',
    'Tarjetas de los Números',
    'Elección Múltiple de los Números',
    'Regla 4 de Ser',
    'Regla 5 de Ser',
    'Palabras y Frases Importantes',
    'Diálogo',
    'Elección Múltiple del Diálogo',
    'Resumen de la Unidad',
    'Práctica de la Unidad Completa'
  ];
  final List<String> subTitles = <String>[
    '(Unit Vocabulary)',
    '(Numbers Flashcards)',
    '(Numbers Multiple Choice)',
    '(Ser Rule 4)',
    '(Ser Rule 5)',
    '(Important Words and Phrases)',
    '(Dialogue)',
    '(Dialogue Multiple Choice)',
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
                    i = 26;
                    //           // Navigates to a temporary Activity page.
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlashcardUI(
                                flashcardJSON: Unit4_1r,
                                // Declare which global flashcardResponse is being used for the activity
                                activityIndex: 1))).then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 1) {
                    i = 27;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlashcardUI(
                                flashcardJSON: Unit4_2ar,
                                // Declare which global flashcardResponse is being used for the activity
                                activityIndex: 1))).then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 2) {
                    i = 28;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit4_2br)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 3) {
                    i = 29;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit4_3r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 4) {
                    i = 30;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit4_4r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 5) {
                    i = 31;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlashcardUI(
                                flashcardJSON: Unit4_5r,
                                // Declare which global flashcardResponse is being used for the activity
                                activityIndex: 1))).then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 6) {
                    i = 32;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DialogueUI(
                                transcript: Unit4_6ar,
                                path: 'assets/audio/6a_Dialogue4.mp3',
                                activityIndex: 8))).then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 7) {
                    i = 33;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit4_6br)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 8) {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Unit4Overview()))
                        .then(onGoBack);
                  } else {
                    i=34;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MultipleChoiceUI(questions: Unit4_7r)))
                                  .then(onGoBack);
                              showMaterialDialog(context, true);
                  }
                },
              ),
            );
          }),

      // body: ListView(
      //   children: <Widget>[
      //     SizedBox(
      //       height: 25,),
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
      //         //IMPLEMENT
      //         onTap: () {
      //           i=26;
      //           // Navigates to a temporary Activity page.
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => FlashcardUI(
      //                       flashcardJSON:
      //                       Unit4_1r, // Declare which global flashcardResponse is being used for the activity
      //                       activityIndex: 1))).then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text("Tarjetas de los Números",
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Numbers Flashcards)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         //IMPLEMENT
      //         onTap: () {
      //           i=27;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => FlashcardUI(
      //                       flashcardJSON:
      //                       Unit4_2ar, // Declare which global flashcardResponse is being used for the activity
      //                       activityIndex: 1))).then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text("Elección Múltiple de los Números",
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Numbers Multiple Choice)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         //IMPLEMENT
      //         onTap: () {
      //           i=28;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       MultipleChoiceUI(questions: Unit4_2br)))
      //               .then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text('Regla 4 de Ser',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Ser Rule 4)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         //IMPLEMENT
      //         onTap: () {
      //           i=29;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       MultipleChoiceUI(questions: Unit4_3r)))
      //               .then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text('Regla 5 de Ser',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Ser Rule 5)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         //IMPLEMENT
      //         onTap: () {
      //           i=30;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       MultipleChoiceUI(questions: Unit4_4r)))
      //               .then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text("Palabras y Frases Importantes",
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
      //         //IMPLEMENT
      //         onTap: () {
      //           i=31;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => FlashcardUI(
      //                       flashcardJSON:
      //                       Unit4_5r, // Declare which global flashcardResponse is being used for the activity
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
      //         //IMPLEMENT
      //         onTap: () {
      //           i=32;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => DialogueUI(
      //                       transcript: Unit4_6ar,
      //                       path: 'assets/audio/6a_Dialogue4.mp3',
      //                       activityIndex: 8))).then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text("Elección Múltiple del Diálogo",
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Dialogue Multiple Choice)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         //IMPLEMENT
      //         onTap: () {
      //           i=33;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       MultipleChoiceUI(questions: Unit4_6br)))
      //               .then(onGoBack);
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
      //         //IMPLEMENT
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => Unit4Overview()))
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
      //         //IMPLEMENT
      //         onTap: () {
      //           i=34;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       MultipleChoiceUI(questions: Unit4_7r)))
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
