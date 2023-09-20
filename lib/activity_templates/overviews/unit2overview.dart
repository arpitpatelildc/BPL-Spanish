import 'package:flutter/material.dart';
import 'package:sif_book/startup/globals.dart';

class Unit2Overview extends StatefulWidget {
  const Unit2Overview({Key? key}) : super(key: key);

  @override
  State<Unit2Overview> createState() => _Unit2OverviewState();
}

class _Unit2OverviewState extends State<Unit2Overview> {
  @override
  // The widget being built here is the entire screen, and the body: ListWidget() creates an inner widget that is the list of Unit3Overview (ToC).
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Unit 2 Overview',
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
        )
      ),
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
        body: Padding(
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
                            "This page will review and summarize all of the new skills you've learned in Unit 2! Read through to refresh your knowledge, and come back as many times as you want to reference the notes. Click on the grammar subject you want to review and get started!",
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
                              title: Text(
                                  "Artículos Indefinidos/Indefinite Articles",
                                  style: TextStyle(
                                      fontSize: subtitleFontSize,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left),
                              children: [
                                Text(
                                    "While definite articles are used to indicate a specific object, indefinite articles are used to indicate a non-specific object. \nSimilar to definite articles, indefinite articles should match the noun in gender and quantity.",
                                    style:
                                        TextStyle(fontSize: subtitleFontSize),
                                    textAlign: TextAlign.left),
                                Image.asset(
                                    "assets/images/Unit2_Overview/Articulos_Indefinidos.png"),
                                Text(
                                    "Examples:\nUn libro - unos libros\nUna mesa - unas mesas\nUn escritorio - unos escritorios\nUn reloj - unos relojes\nUn profesor - unos profesores\nUn perro - unos perros\nUna lámpara - unas lámparas\n\nNecesito un libro (Indefinido)\n¿Cuál libro?\nEl libro de español (Definido)",
                                    style:
                                        TextStyle(fontSize: subtitleFontSize),
                                    textAlign: TextAlign.left)
                              ]),
                          ExpansionTile(
                              title: Text("Preposiciones/Prepositions",
                                  style: TextStyle(
                                      fontSize: subtitleFontSize,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left),
                              expandedAlignment: Alignment.center,
                              children: [
                                Text(
                                    "Remember these prepositions for directions and locations:\n\na la derecha - on the right",
                                    style:
                                        TextStyle(fontSize: subtitleFontSize),
                                    textAlign: TextAlign.left),
                                Image.asset(
                                    "assets/images/Chapter2_Preposition_Images/derecha.JPEG"),
                                Text("\na la izquierda - on the left",
                                    style:
                                        TextStyle(fontSize: subtitleFontSize),
                                    textAlign: TextAlign.left),
                                Image.asset(
                                    "assets/images/Chapter2_Preposition_Images/izquierda.JPEG"),
                                Text("\nen frente (de) - in front of",
                                    style:
                                        TextStyle(fontSize: subtitleFontSize),
                                    textAlign: TextAlign.left),
                                Image.asset(
                                    "assets/images/Chapter2_Preposition_Images/frente.JPEG"),
                                Text("\ndetrás (de) - behind",
                                    style:
                                        TextStyle(fontSize: subtitleFontSize),
                                    textAlign: TextAlign.left),
                                Image.asset(
                                    "assets/images/Chapter2_Preposition_Images/detras.JPEG"),
                                Text("\nal lado (de) - next to",
                                    style:
                                        TextStyle(fontSize: subtitleFontSize),
                                    textAlign: TextAlign.left),
                                Image.asset(
                                    "assets/images/Chapter2_Preposition_Images/al_lado.JPEG"),
                                Text("\nencima (de) - on top of",
                                    style:
                                        TextStyle(fontSize: subtitleFontSize),
                                    textAlign: TextAlign.left),
                                Image.asset(
                                    "assets/images/Chapter2_Preposition_Images/encima.JPEG"),
                                Text("\ndebajo (de) - under",
                                    style:
                                        TextStyle(fontSize: subtitleFontSize),
                                    textAlign: TextAlign.left),
                                Image.asset(
                                    "assets/images/Chapter2_Preposition_Images/debajo.JPEG"),
                              ]),
                          ExpansionTile(
                              title: Text("Hay y no Hay",
                                  style: TextStyle(
                                      fontSize: subtitleFontSize,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left),
                              expandedAlignment: Alignment.center,
                              children: [
                                Text(
                                    "In Spanish, the verb \"hay\" is used to indicate \"there is\" or \"there are\". \n\"Hay\" is the only conjugation of the verb \"haber\" in the present tense.\n\nExamples:\nPregunta: \n   ¿Hay café en la oficina?\nRespuesta:\n   Sí, hay café en la oficina.\nPregunta:\n   ¿Hay estudiantes en el salón?\nRespuesta:\n   Sí, hay estudiantes en el salón.\nPregunta:\n   ¿Hay huevos en el refrigerador?\nRespuesta:\n   No, no hay huevos en el refrigerador.",
                                    style:
                                        TextStyle(fontSize: subtitleFontSize),
                                    textAlign: TextAlign.left),
                              ]),
                          SizedBox(
                            height: 25,
                          ),
                        ])))));
  }
}
