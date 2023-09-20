import 'dart:async';
import 'package:sif_book/activity_templates/multiple_choice/multiplechoice_ui.dart';
import 'package:sif_book/startup/globals.dart';
import 'package:flutter/material.dart';
import 'package:sif_book/activity_templates/flashcards/flashcard_ui.dart';
import 'package:sif_book/units/neurosciencepage.dart';
import 'package:sif_book/activity_templates/overviews/unit5overview.dart';

class Unit5Activitys extends StatefulWidget {
  const Unit5Activitys({Key? key}) : super(key: key);

  @override
  State<Unit5Activitys> createState() => _Unit5ActivitysState();
}

class _Unit5ActivitysState extends State<Unit5Activitys> {
  @override
// The widget being built here is the entire screen, and the body: ListWidget() creates an inner widget that is the list of Units.
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Unidad 5',
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
    'Regla 6 del Verbo  Ser',
    'Precios y Monedas',
    'Todas las Reglas del Verbo Ser',
    'Resumen de la Unidad',
    'Práctica de la Unidad Completa'
  ];
  final List<String> subTitles = <String>[
    '(Unit Vocabulary)',
    'Rule #6 Verb to be (ser)',
    '(Prices and Currency)',
    '(All rules verb to be (Ser))',
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
                    i = 35;
                    //           // Navigates to a temporary Activity page.
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlashcardUI(
                                flashcardJSON: Unit5_1r,
                                // Declare which global flashcardResponse is being used for the activity
                                activityIndex: 1))).then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 1) {
                    i = 36;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit5_2r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 2) {
                    i = 37;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit5_3r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 3) {
                    i = 38;
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MultipleChoiceUI(questions: Unit5_4r)))
                        .then(onGoBack);
                    showMaterialDialog(context, true);
                  } else if (index == 4) {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Unit5Overview()))
                        .then(onGoBack);
                  } else {
              i = 39;
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MultipleChoiceUI(questions: Unit5_5r)))
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
      //       height: 25,
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child: ListTile(
      //         title: Text(
      //           "Vocabulario de la Unidad",
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle: Text(
      //           '(Unit Vocabulary)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         //IMPLEMENT
      //         onTap: () {
      //           i = 35;
      //           // Navigates to a temporary Activity page.
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => FlashcardUI(
      //                       flashcardJSON: Unit5_1r,
      //                       // Declare which global flashcardResponse is being used for the activity
      //                       activityIndex: 1))).then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child: ListTile(
      //         title: Text(
      //           'Regla 6 del Verbo  Ser',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle: Text(
      //           'Rule #6 Verb to be (ser)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         //IMPLEMENT
      //         onTap: () {
      //           i = 36;
      //           Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) =>
      //                           MultipleChoiceUI(questions: Unit5_2r)))
      //               .then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child: ListTile(
      //         title: Text(
      //           'Precios y Monedas',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle: Text(
      //           '(Prices and Currency)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         //IMPLEMENT
      //         onTap: () {
      //           i = 37;
      //           Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) =>
      //                           MultipleChoiceUI(questions: Unit5_3r)))
      //               .then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child: ListTile(
      //         title: Text(
      //           'Todas las Reglas del Verbo Ser',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle: Text(
      //           '(All rules verb to be (Ser))',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: unlocked,
      //         selected: true,
      //         enabled: true,
      //         //IMPLEMENT
      //         onTap: () {
      //           i = 38;
      //           Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) =>
      //                           MultipleChoiceUI(questions: Unit5_4r)))
      //               .then(onGoBack);
      //           showMaterialDialog(context, true);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child: ListTile(
      //         title: Text(
      //           'Resumen de la Unidad',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle: Text(
      //           '(Unit Overview)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: (unit5SerComplete) ? unlocked : locked,
      //         selected: (unit5SerComplete) ? true : false,
      //         enabled: (unit5SerComplete) ? true : false,
      //         //IMPLEMENT
      //         onTap: () {
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => Unit5Overview())).then(onGoBack);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child: ListTile(
      //         title: Text(
      //           'Práctica de la Unidad Completa',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle: Text(
      //           '(Full Unit Practice)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: (unit5SerComplete) ? unlocked : locked,
      //         selected: (unit5SerComplete) ? true : false,
      //         enabled: (unit5SerComplete) ? true : false,
      //         //IMPLEMENT
      //         onTap: () {
      //           i = 39;
      //           Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) =>
      //                           MultipleChoiceUI(questions: Unit5_5r)))
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
