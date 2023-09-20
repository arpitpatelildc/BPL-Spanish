import 'dart:async';
import 'package:sif_book/activity_templates/dialogue/dialogue_ui.dart';
import 'package:sif_book/activity_templates/multiple_choice/multiplechoice_ui.dart';
import 'package:sif_book/startup/globals.dart';
import 'package:flutter/material.dart';
import 'package:sif_book/activity_templates/flashcards/flashcard_ui.dart';
import 'package:sif_book/units/neurosciencepage.dart';
import 'package:sif_book/activity_templates/overviews/unit3overview.dart';

class Unit3Activitys extends StatefulWidget {
  const Unit3Activitys({Key? key}) : super(key: key);

  @override
  State<Unit3Activitys> createState() => _Unit3ActivitysState();
}

class _Unit3ActivitysState extends State<Unit3Activitys> {
  @override
// The widget being built here is the entire screen, and the body: ListWidget() creates an inner widget that is the list of Units.
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Unidad 3',
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
    'Familia',
    'Regla 2 de Ser',
    'Tener y Llevar',
    'Di tu Nombre',
    'Regla 3 de Ser',
    'Palabras y Frases Importantes',
    'Diálogo',
    'Resumen de la Unidad',
    'Práctica de la Unidad Completa'
  ];
  final List<String> subTitles = <String>[
    '(Unit Vocabulary)',
    '(Family)',
    '(Ser Rule 2)',
    '(Tener and Llevar)',
    '(Say your Name)',
    '(Ser Rule 3)',
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
                    i = 17;
                    // Navigates to a temporary Activity page.
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlashcardUI(
                                flashcardJSON: Unit3_1r,
                                // Declare which global flashcardResponse is being used for the activity
                                activityIndex: 1))).then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 1) {
                    i = 18;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit3_2r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 2) {
                    i = 19;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit3_3r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 3) {
                    i = 20;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit3_4r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 4) {
                    i = 21;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit3_5r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 5) {
                    i = 22;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit3_6r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 6) {
                    i = 23;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlashcardUI(
                                flashcardJSON: Unit3_7r,
                                // Declare which global flashcardResponse is being used for the activity
                                activityIndex: 1))).then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 7) {
                    i=24;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DialogueUI(
                                transcript: Unit3_8r,
                                path: 'assets/audio/ch1-dialogue.mp3',
                                activityIndex: 8))).then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 8){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Unit3Overview()))
                        .then(onGoBack);

                  } else {
                    i = 25;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit3_9r)))
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
      //           i=17;
      //           // Navigates to a temporary Activity page.
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => FlashcardUI(
      //                       flashcardJSON:
      //                       Unit3_1r, // Declare which global flashcardResponse is being used for the activity
      //                       activityIndex: 1))).then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text("Familia",
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Family)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         //IMPLEMENT
      //         onTap: () {
      //           i=18;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       MultipleChoiceUI(questions: Unit3_2r)))
      //               .then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text('Regla 2 de Ser',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Ser Rule 2)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         //IMPLEMENT
      //         onTap: () {
      //           i=19;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       MultipleChoiceUI(questions: Unit3_3r)))
      //               .then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text('Tener y Llevar',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Tener and Llevar)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         //IMPLEMENT
      //         onTap: () {
      //           i=20;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       MultipleChoiceUI(questions: Unit3_4r)))
      //               .then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text('Di tu Nombre',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Say your Name)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         //IMPLEMENT
      //         onTap: () {
      //           i=21;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       MultipleChoiceUI(questions: Unit3_5r)))
      //               .then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child:
      //       ListTile(
      //         title:  Text('Regla 3 de Ser',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle:  Text('(Ser Rule 3)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         //IMPLEMENT
      //         onTap: () {
      //           i=22;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       MultipleChoiceUI(questions: Unit3_6r)))
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
      //         //IMPLEMENT
      //         onTap: () {
      //           i=23;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => FlashcardUI(
      //                       flashcardJSON:
      //                       Unit3_7r, // Declare which global flashcardResponse is being used for the activity
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
      //           i=24;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => DialogueUI(
      //                       transcript: Unit3_8r,
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
      //         //IMPLEMENT
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => Unit3Overview()))
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
      //           i=25;
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) =>
      //                       MultipleChoiceUI(questions: Unit3_9r)))
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
