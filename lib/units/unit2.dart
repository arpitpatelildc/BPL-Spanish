import 'dart:async';
import 'package:sif_book/activity_templates/dialogue/dialogue_ui.dart';
import 'package:sif_book/activity_templates/multiple_choice/multiplechoice_ui.dart';
import 'package:sif_book/startup/globals.dart';
import 'package:flutter/material.dart';
import 'package:sif_book/activity_templates/flashcards/flashcard_ui.dart';
import 'package:sif_book/units/neurosciencepage.dart';
import 'package:sif_book/activity_templates/overviews/unit2overview.dart';

class Unit2Activitys extends StatefulWidget {
  const Unit2Activitys({Key? key}) : super(key: key);

  @override
  State<Unit2Activitys> createState() => _Unit2ActivitysState();
}

class _Unit2ActivitysState extends State<Unit2Activitys> {
  @override
// The widget being built here is the entire screen, and the body: ListWidget() creates an inner widget that is the list of Units.
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Unidad 2',
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
    'Artículos Indefinidos',
    'Plurales, parte 2',
    'Preposiciones',
    'Palabras y Frases Importantes',
    'Diálogo',
    'Resumen de la Unidad',
    'Práctica de la Unidad Completa'
  ];
  final List<String> subTitles = <String>[
    '(Unit Vocabulary)',
    '(Indefinite Articles)',
    '(Plurals, part 2)',
    '(Prepositions)',
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
                    style:
                        TextStyle(fontSize: subtitleFontSize, color: sifGreen),
                  ),
                  visualDensity: VisualDensity(vertical: -4),
                  trailing: unlocked,
                  selected: true,
                  enabled: true,
                  onTap: () {
                    if (index == 0) {
                      i = 10;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FlashcardUI(
                                  flashcardJSON: Unit2_1r,
                                  activityIndex: 1))).then(onGoBack);
                      showMaterialDialog(context, true);
                    } else if (index == 1) {
                      i = 11;
                      //           // Navigates to a temporary Activity page.
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MultipleChoiceUI(
                                    questions: Unit2_2r,
                                  ))).then(onGoBack);
                      showMaterialDialog(context, true);
                    } else if (index == 2) {
                      i = 12;
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MultipleChoiceUI(questions: Unit2_3r)))
                          .then(onGoBack);
                      showMaterialDialog(context, true);
                    } else if (index == 3) {
                      i = 13;
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MultipleChoiceUI(questions: Unit2_4r)))
                          .then(onGoBack);
                      showMaterialDialog(context, true);
                    } else if (index == 4) {
                      i = 14;
                      //           // Navigates to a temporary Activity page.
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FlashcardUI(
                                  flashcardJSON: Unit2_5r,
                                  activityIndex: 1))).then(onGoBack);
                      showMaterialDialog(context, true);
                    } else if (index == 5) {
                      i = 15;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DialogueUI(
                                  transcript: Unit2_6r,
                                  path: 'assets/audio/ch2-dialogue.mp3',
                                  activityIndex: 8))).then(onGoBack);
                      showMaterialDialog(context, true);
                    } else if (index == 6) {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Unit2Overview()))
                          .then(onGoBack);
                    } else if (index == 7) {
                      i = 16;
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MultipleChoiceUI(questions: Unit2_7r)))
                          .then(onGoBack);
                      showMaterialDialog(context, true);
                    }
                  },
                ),
              );
            })
        // body: ListView(
        //   children: <Widget>[
        //     SizedBox(
        //       height: 25,
        //     ),
        //     SizedBox(
        //       height: boxHeight,
        //       child: ListTile(
        //         title:  Text("Vocabulario de la Unidad",
        //           textAlign: TextAlign.left,
        //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
        //         ),
        //         subtitle: Text('(Unit Vocabulary)',
        //           textAlign: TextAlign.left,
        //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
        //         ),
        //         trailing: unlocked,
        //         selected: true,
        //         enabled: true,
        //         //IMPLEMENT
        //         onTap: () {
        //           i=10;
        //           // Navigates to a temporary Activity page.
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) =>
        //                       FlashcardUI(flashcardJSON: Unit2_1r,activityIndex:1)))
        //               .then(onGoBack);
        //           showMaterialDialog(context, true);
        //         },
        //       ),
        //     ),
        //     SizedBox(
        //       height: boxHeight,
        //       child: ListTile(
        //         title:  Text("Artículos Indefinidos",
        //           textAlign: TextAlign.left,
        //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
        //         ),
        //         subtitle:  Text('(Indefinite Articles)',
        //           textAlign: TextAlign.left,
        //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
        //         ),
        //         trailing: unlocked,
        //         selected: true,
        //         enabled: true,
        //         //IMPLEMENT
        //         onTap: () {
        //           i=11;
        //           // Navigates to a temporary Activity page.
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => MultipleChoiceUI(
        //                     questions: Unit2_2r,
        //                   ))).then(onGoBack);
        //           showMaterialDialog(context, true);
        //         },
        //       ),
        //     ),
        //     SizedBox(
        //       height: boxHeight,
        //       child: ListTile(
        //         title:  Text('Plurales, parte 2',
        //           textAlign: TextAlign.left,
        //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
        //         ),
        //         subtitle:  Text('(Plurals, part 2)',
        //           textAlign: TextAlign.left,
        //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
        //         ),
        //         trailing: unlocked,
        //         selected: true,
        //         enabled: true,
        //         //IMPLEMENT
        //         onTap: () {
        //           i=12;
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => MultipleChoiceUI(
        //                       questions: Unit2_3r))).then(onGoBack);
        //           showMaterialDialog(context, true);
        //         },
        //       ),
        //     ),
        //     SizedBox(
        //       height: boxHeight,
        //       child: ListTile(
        //         title:  Text('Preposiciones',
        //           textAlign: TextAlign.left,
        //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
        //         ),
        //         subtitle:  Text('(Prepositions)',
        //           textAlign: TextAlign.left,
        //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
        //         ),
        //         trailing: unlocked,
        //         selected: true,
        //         enabled: true,
        //         //IMPLEMENT
        //         onTap: () {
        //           i=13;
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => MultipleChoiceUI(
        //                       questions:Unit2_4r))).then(onGoBack);
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
        //           i=14;
        //           // Navigates to a temporary Activity page.
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) =>
        //                       FlashcardUI(flashcardJSON: Unit2_5r,activityIndex:1)))
        //               .then(onGoBack);
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
        //           i=15;
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) => DialogueUI(
        //                       transcript: Unit2_6r,
        //                       path: 'assets/audio/ch2-dialogue.mp3',
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
        //                   builder: (context) => Unit2Overview()))
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
        //           i=16;
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) =>
        //                       MultipleChoiceUI(questions: Unit2_7r)))
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
