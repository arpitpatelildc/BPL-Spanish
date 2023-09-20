import 'package:flutter/material.dart';
import 'package:sif_book/startup/globals.dart';

class Unit5Overview extends StatefulWidget {
  const Unit5Overview({Key? key}) : super(key: key);

  @override
  State<Unit5Overview> createState() => _Unit5OverviewState();
}

class _Unit5OverviewState extends State<Unit5Overview> {
  @override
  // The widget being built here is the entire screen, and the body: ListWidget() creates an inner widget that is the list of Unit3Overview (ToC).
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Unit 5 Overview',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: headerFontSize),
        ),
        toolbarHeight: headerHeight,
      ),
      body: //Padding(
          //padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
          //child:
          Center(
              child: Scaffold(
        body: ListWidget(),
      )),
      // ),
    );
  }
}

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
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
        body: Scrollbar(
            isAlwaysShown: true,
            thickness: 10,
            radius: Radius.circular(5),
            child: Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                child: Scrollbar(
                    isAlwaysShown: true,
                    thickness: 10,
                    radius: Radius.circular(5),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
                      child: ListView(children: <Widget>[
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "This page will review and summarize all of the new skills you've learned in Unit 5! Read through to refresh your knowledge, and come back as many times as you want to reference the notes. Click on the grammar subject you want to review and get started!",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: subtitleFontSize),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          '''
Note: This overview does not cover vocab, so feel free to return to the Flashcard sets to review those!
          ''',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: subtitleFontSize),
                        ),
                        ExpansionTile(
                            title: Row(children: <Widget>[
                              Text(
                                'Ser Rule No. 6',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
First of all, we will review the 6th and final Ser Rule! 

The final context in which we can use "ser" is when we're expressing origin and nationality, such as saying \"She is American\" or \"He is Canadian\"
                
To describe someone's origin/nationality, we use the sentence structure (subject) (ser conjugation) (adjective), where the adjective is the person's origen/nationality.

Example: "Yo soy cubano."
"Yo" is the subject.
"soy" is the corresponding ser conjugation.
"cubano" is the origin/nationality (which is written in the correct form to match the subject).
                ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                            ]),
                        ExpansionTile(
                            title: Row(children: <Widget>[
                              Text(
                                'Cost and Currency',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
Next, we will review how to discuss currency in Spanish. Remember that the currencies for different Spanish speaking countries are in this Unit's "Vocab Flashcards."
                
¿Cuánto cuesta? = How much does it cost?
Cuesta \$1.25 = It costs \$1.25
                
¿Cuánto cuestan? = How much do they cost?
Cuestan \$1.25 = They cost \$1.25
                
Notice that "cuesta" changes to "cuestan" when we go from a singular item to multiple.
                ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                            ]),
                        ExpansionTile(
                            title: Row(children: <Widget>[
                              Text(
                                'All Ser Rules',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
Finally, we will review all of the rules of "ser" learned throughout Units 1-5. A summary of each rule is included below. 
                ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                              Image.asset(
                                  "assets/images/Unit5_Overview/Regla1y2.png"),
                              Image.asset(
                                  "assets/images/Unit5_Overview/Regla3.png"),
                              Image.asset(
                                  "assets/images/Unit5_Overview/Regla4.png"),
                              Image.asset(
                                  "assets/images/Unit5_Overview/Regla5.png"),
                              Image.asset(
                                  "assets/images/Unit5_Overview/Regla6.png"),
                            ]),
                        SizedBox(
                          height: 25,
                        ),
                      ]),
                    )))));
  }
}
