import 'package:flutter/material.dart';
import 'package:sif_book/startup/globals.dart';

class Unit4Overview extends StatefulWidget {
  const Unit4Overview({Key? key}) : super(key: key);

  @override
  State<Unit4Overview> createState() => _Unit4OverviewState();
}

class _Unit4OverviewState extends State<Unit4Overview> {
  @override
  // The widget being built here is the entire screen, and the body: ListWidget() creates an inner widget that is the list of Unit3Overview (ToC).
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Unit 4 Overview',
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
                          "This page will review and summarize all of the new skills you've learned in Unit 4! Read through to refresh your knowledge, and come back as many times as you want to reference the notes. Click on the grammar subject you want to review and get started!",
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
                                'Numbers',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
Let's review numbers in Spanish!

Just like English, Spanish numbers follow patterns.
-For 10 through 15, there are special words used (similar to ten, eleven, and twelve in English)
   Ex: 11 = once
-For 16 through 19, there is a "dieci" prefix before the number in the ones place
   Ex: 17 = diecisiete
-For 21 through 29, there is a "veinti" prefix before the number in the ones place
   Ex: 24 = veinticuatro
-For 31 through 99, we simply use the structure "tens y ones" 
   Ex: 53 = cincuenta y tres
-For 100, we say cien
-For 101 through 199, we say "ciento" and then the rest of the number in normal form
   Ex: 186 = ciento ochenta y seis
-For 200 through 999, we follow the same formula, but add a number prefix to the front of "ciento" to represent how many hundreds there are
   Ex: 879 = ochocientos setenta y nueve
-For 1000 through 1999, we say "mil" and then the rest of the number in normal form
   Ex: 1034 = mil treinta y cuatro
-For 2000 through 9999, me follow the same formula, but add the number of thousands in front of the "mil"
   Ex: 4248 = cuatro mil doscientos cuarenta y ocho

Try to memorize these words and rules! The more you practice, the easier it will become.
                ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                            ]),
                        ExpansionTile(
                            title: Row(children: <Widget>[
                              Text(
                                'Ser Rule 4',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
Let's look at Ser Rule No. 4! We can use Ser to tell time. Time in Spanish is similar to time in English.

Here are some examples:
1:00 | Es la una en punto (o'clock)
2:00 | Son las dos
3:00 | Son las tres 

4:05 | Son las cuatro y cinco
4:15 | Son las cuatro y cuarto (quarter past 4) 
4:20 | Son las cuatro y veinte
4:25 | Son las cuatro y veinticinco
4:30 | Son las cuatro y media (half past 4)
4:35 | Son las cinco menos veinticinco (25 minutes to 5)
4:45 | Son las cinco menos cuarto (quarter to 5)

6:27 | Son las seis y veintisiete
8:52 | Son las ocho y cincuenta y dos

12:00 a.m. | medianoche
12:00 p.m. | mediodía

a.m. | de la mañana
p.m. | de la tarde
p.m. | de la noche (used when the sun is gone)

Note: Remember that 1 is special and uses "es la" instead of "son las"
Note: Notice that "cuaTRo" (4) is different from "cuaRTo" (quarter)
                ''',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: subtitleFontSize),
                              ),
                            ]),
                        ExpansionTile(
                            title: Row(children: <Widget>[
                              Text(
                                'Ser Rule 5',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: subtitleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            children: [
                              Text(
                                '''
Now we'll review the 5th Ser Rule! 

First, take note of date-related vocabulary:
año = year
mes = month
semana = week
día = day
enero = January
febrero = February
marzo = March
abril = April
mayo = May
junio = June
julio = July
agosto = August
septiembre = September
octubre = October
noviembre = November
deciembre = December

Note: Notice that months are not capitalized in Spanish.

Here is an example of using Ser to say the date "October 7, 2020":
Hoy es el 7 de octubre del 2020
(Today is the 7th of October of 2020)
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
