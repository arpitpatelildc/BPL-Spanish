import 'package:flutter/material.dart';
import 'package:sif_book/startup/globals.dart';

class Unit3Overview extends StatefulWidget {
  const Unit3Overview({Key? key}) : super(key: key);

  @override
  State<Unit3Overview> createState() => _Unit3OverviewState();
}

class _Unit3OverviewState extends State<Unit3Overview> {
  @override
  // The widget being built here is the entire screen, and the body: ListWidget() creates an inner widget that is the list of Unit3Overview (ToC).
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Unit 3 Overview',
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
                          "This page will review and summarize all of the new skills you've learned in Unit 3! Read through to refresh your knowledge, and come back as many times as you want to reference the notes. Click on the grammar subject you want to review and get started!",
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
                                'Family',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
Let's briefly review the way we talk about family members in Spanish:
          
In English, we would say "The brother of my mother is my uncle".
In Spanish, we would say "El hermano de mi madre es mi tío".

This is the form that the questions about family relationships will be in.
                ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                            ]),
                        ExpansionTile(
                            title: Row(children: <Widget>[
                              Text(
                                'Ser Rule No. 2',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
Next, we'll review the 2nd Rule of Ser. Remember, this is the Rule that says we can use Ser to describe people.
          
The sentence structure we use to do this goes like so:
(subject) (ser conjugation) (adjective)
          
Ex: "Ella es alta"
| "Ella" = subject
| "es" = ser conjugation (that corresponds to "Ella")
| "alta" = adjective (in the form that corresponds to "Ella") 
       
Note: Sometimes Spanish speakers don't say the adjective if it is already reasonably implied! In the example above, this means we would simply say "Es alta" instead.
          ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                            ]),
                        ExpansionTile(
                            title: Row(children: <Widget>[
                              Text(
                                'Tener Y Llevar',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
To start, let's remind ourselves of the translations and conjugations of these words:

llevar = to wear
| yo llevo
| tú llevas
| él/ella/usted lleva
| nosotros llevamos
| vosotros lleváis
| ellos/ellas/ustedes llevan

tener = to have
| yo tengo
| tú tienes
| él/ella/usted tiene
| nosotros tenemos
| vosotros tenéis
| ellos/ellas/ustedes tienen

Now, we'll dive into sentence structures.

Sentence structures that use "llevar" include:
(subject) (llevar conjugation) (noun).
| Ex: Yo llevo gafas.
| Ex: I wear glasses.
Note: In Spanish, to describe someone with a mustache (bigote) or beard (barba), llevar must be used (i.e. "You wear a beard").

Sentence structures that use "tener" include:
(subject) (tener conjugation) el pelo (ajective).
| Ex: Ella tiene el pelo liso.
| Ex: She has straight hair.
OR
(subject) (tener conjugation) los ojos (ajective).
| Ex: Usted tiene los ojos verdes.
| Ex: You have green eyes.
OR
(subject) (tener conjugation) (number) años.
| Ex: Tú tienes 50 años.
| Ex: You are 50 years old.
Note: As you can see, this sentence structure is used to express age in Spanish, even though it translates more literally to "I have 50 years".
                ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                            ]),
                        ExpansionTile(
                            title: Row(children: <Widget>[
                              Text(
                                'Say Your Name',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
If someone were to ask "What is your name?", you might respond "My name is John" in English. These grammar structures work very similarly in Spanish.

Here are some examples of questions and appropriate responses:
Note: Each of the questions has tu/su or te/se in it. This is because you may use either of the words when asking about names. "Tu" and "te" correspond to the subject "Tú", and are used when addressing someone you speak to informally. "Su" and "se" correspond to the subject "Usted", and are used when addressing someone you speak to formally.

| Q: ¿Cuál es tu/su nombre? (What is your name?)
| A: Mi nombre es Susan. (My name is Susan.)

| Q: ¿Cuál es el nombre de tu/su padre? (What is your father's name?)
| A: El nombre de mi padre es Nathan. (My father's name is Nathan.)

| Q: ¿Cómo se llama usted?/¿Cómo te llamas tú? (What is your name?)
| A: Me llamo Carlotta. (My name is Carlotta.)

| Q: ¿Cómo se llama su/tu madre? (What is your mother's name?)
| A: Mi madre se llama Clara. (My mother's name is Clara.)

As you can see, there are a couple of ways to ask for someone's name in Spanish. Either way is fine, so long as the correct subjects and pronouns are being used.
                ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                            ]),
                        ExpansionTile(
                            title: Row(children: <Widget>[
                              Text(
                                'Ser Rule No. 3',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
Let's review the 3rd Rule of Ser! Ser can also be used to state people's professions. To describe someone's profession we use the following sentence structure:
(subject) (ser conjugation) (indefinite article) (profession)

Ex: "Yo soy un escritor".
| "Yo" = subject
| "soy" = ser conjugation (that corresponds to "Yo")
| "un" = indefinite article (that corresponds to "abogado")
| "abogado" = profession (in the form that corresponds to "Yo")

When you're trying to determine which indefinite article to use, remember the rules that you practiced in Unit 2! You can refer back to them if you need.
                ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                            ]),
                        SizedBox(
                          height: 25,
                        ),
                      ]),
                    )))));
  }
}
