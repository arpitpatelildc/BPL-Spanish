import 'package:flutter/material.dart';
import 'package:sif_book/startup/globals.dart';

class Unit1Overview extends StatefulWidget {
  const Unit1Overview({Key? key}) : super(key: key);

  @override
  State<Unit1Overview> createState() => _Unit1OverviewState();
}

class _Unit1OverviewState extends State<Unit1Overview> {
  @override
  // The widget being built here is the entire screen, and the body: ListWidget() creates an inner widget that is the list of Unit3Overview (ToC).
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Unit 1 Overview',
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
          "This page will review and summarize all of the new skills you've learned in Unit 1! Read through to refresh your knowledge, and come back as many times as you want to reference the notes. Click on the grammar subject you want to review and get started!",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: subtitleFontSize),
        ),SizedBox(
          height: 25,
        ),
        Text(
          'Note: This overview does not cover the alphabet or vocab, so feel free to return to the Flashcard sets to review those!',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: subtitleFontSize),
                        ),
                        ExpansionTile(
                            title: Row(children: <Widget>[
                              Text(
                                'Definite Articles',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
First, let's review the way we use definite articles with nouns:
                    
The definite article should match the gender and quantity of the noun.
                    
                                Singular |  Plural
          Masculine |       el       |       los
          Feminine   |       la       |       las
                          
                                        
The general rules on how to decide which article is correct is:
          
   - If the noun ends in "o," it is most likely masculine
          
   - If the noun ends in an accented vowel, it is most likely masculine
          
   - If the noun ends in "-or," it is most likely masculine
          
   - If the noun ends in "-aje," it is most likely masculine
          
   - If the noun ends in "a," it is most likely feminine
           
   - If the noun ends in "-ción" or "-sión," it is most likely feminine
          
   - If the noun ends in "-ía," it is most likely feminine
          
   - If the noun ends in "-dad," it is most likely feminine
          ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                            ]),
                        ExpansionTile(
                            title: Row(children: <Widget>[
                              Text(
                                'Plurals',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
Next, we'll review how to convert nouns from the singular to the plural form.
          
To convert a noun to its plural form:

   - If it ends on a vowel, add an "s" to the end

   - If it ends on a consonant, add an "es" to the end
          

In order to get the singular form of the noun from the plural form, just undo the process above!
          ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                            ]),
                        ExpansionTile(
                            title: Row(children: <Widget>[
                              Text(
                                'Adjectives',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
Now we will review how to describe nouns with adjectives.

Remember that the form of the adjective must match the form of the noun.

   - When the noun is in singular form, the adjective is also in singular form

        -- Example: the yellow house = la casa amarilla

   - When the noun is in plural form, you must also add an "s" or "es" to the end of the adjective

        -- Example: the yellow houses = las casas amarillas


Adjectives can either be masculine, feminine, or neutral.

   - If the noun is feminine, the adjective usually ends with "a" (singular) or "as" (plural)

        -- Example: la mesa roja, las mesas rojas

   - If the noun is masculine, the adjective usually ends with "o" (singular) or "os" (plural)

        -- Example: el perro rojo, los perros rojos

   - If the adjective is neutral, it usually ends with an "e," or a consonant, so it stays in this form and just changes to "es" if the noun is plural 
                ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                            ]),
                        ExpansionTile(
                            title: Row(children: <Widget>[
                              Text(
                                'Ser Conjugations',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
Here we will review the verb ser and its conjugations.
                
Remember that ser means "to be."
                
The 6 possible noun forms for a conjugated verb are below:
                
   - yo = I 
   - tú = you (informal form) 
   = él / ella / usted = he / she / you (formal form), it 
   - nosotros = we 
   - vosotros = y'all 
   - ellos / ellas / ustedes = them (masculine, feminine, formal forms), those 
                
                
The conjugations for the verb "ser" are as follows:
                                   yo | soy   
                                    tú | eres  
                 él/ella/usted | es    
                        nosotros | somos 
                        vosotros | sois  
     ellos/ellas/ustedes | son   
                ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                            ]),
                        ExpansionTile(
                            title: Row(children: <Widget>[
                              Text(
                                'Ser Rule No. 1',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
Finally, we will review the first rule of the verb ser.
                
Remember that this rule states that we use the verb ser to describe nouns, such as people and things, with adjectives.
                
The sentence is structured as such:
   (definite article) + (noun) +  (conjugated form of ser) + (adjective.)
   Example: (El) + (gato) + (es) + (blanco)
                ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                            ]),
                        SizedBox(
                          height: 25,
                        ),
                      ]),
                    ))));
  }
}
