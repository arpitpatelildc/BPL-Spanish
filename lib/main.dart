import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'startup/splashscreen.dart';
import 'startup/globals.dart';
import 'utils/route/navigation.dart';

void main() async {
  // Force the program to wait
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Main error ======== 1 ==$e');
  }

  String popups = await rootBundle.loadString('assets/json/popups.json');
  popupsJson = json.decode(popups);

  // CHAPTER 1 JSON
  String Unit1_1 = await rootBundle
      .loadString('assets/json/Unidad1/1_AlphabetFlashcards.json');
  String Unit1_2 =
      await rootBundle.loadString('assets/json/Unidad1/2_Unit1Vocab.json');
  String Unit1_3 = await rootBundle
      .loadString('assets/json/Unidad1/3_DefiniteArticles.json');
  String Unit1_4 =
      await rootBundle.loadString('assets/json/Unidad1/4_Plurals.json');
  String Unit1_5 =
      await rootBundle.loadString('assets/json/Unidad1/5_Adjectives.json');
  String Unit1_6 =
      await rootBundle.loadString('assets/json/Unidad1/6_SerConjugations.json');
  String Unit1_7 =
      await rootBundle.loadString('assets/json/Unidad1/7_SerRule1.json');
  String Unit1_8 = await rootBundle
      .loadString('assets/json/Unidad1/8_ImportantWordsPhrases1.json');
  String Unit1_9 =
      await rootBundle.loadString('assets/json/Unidad1/9_Dialogue1.json');
  String Unit1_10 = await rootBundle
      .loadString('assets/json/Unidad1/10_FullUnit1Practice.json');

  // Chapter 2 json
  String Unit2_1 =
      await rootBundle.loadString('assets/json/Unidad2/1_Unit2Vocab.json');
  String Unit2_2 = await rootBundle
      .loadString('assets/json/Unidad2/2_IndefiniteArticles.json');
  String Unit2_3 =
      await rootBundle.loadString('assets/json/Unidad2/3_PluralsUnYUna.json');
  String Unit2_4 =
      await rootBundle.loadString('assets/json/Unidad2/4_Prepositions.json');
  String Unit2_5 = await rootBundle
      .loadString('assets/json/Unidad2/5_ImportantWordsPhrases2.json');
  String Unit2_6 =
      await rootBundle.loadString('assets/json/Unidad2/6_Dialogue2.json');
  String Unit2_7 = await rootBundle
      .loadString('assets/json/Unidad2/7_FullUnit2Practice.json');

  // Chapter 3 json upload
  String Unit3_1 =
      await rootBundle.loadString('assets/json/Unidad3/1_Unit3Vocab.json');
  String Unit3_2 =
      await rootBundle.loadString('assets/json/Unidad3/2_Family.json');
  String Unit3_3 =
      await rootBundle.loadString('assets/json/Unidad3/3_SerRule2.json');
  String Unit3_4 =
      await rootBundle.loadString('assets/json/Unidad3/4_TenerLlevar.json');
  String Unit3_5 =
      await rootBundle.loadString('assets/json/Unidad3/5_SayYourName.json');
  String Unit3_6 =
      await rootBundle.loadString('assets/json/Unidad3/6_SerRule3.json');
  String Unit3_7 = await rootBundle
      .loadString('assets/json/Unidad3/7_ImportantWordsPhrases3.json');
  String Unit3_8 =
      await rootBundle.loadString('assets/json/Unidad3/8_Dialogue3.json');
  String Unit3_9 = await rootBundle
      .loadString('assets/json/Unidad3/9_FullUnit3Practice.json');

  // Chapter 4 json upload
  String Unit4_1 =
      await rootBundle.loadString('assets/json/Unidad4/1_Unit4Vocab.json');
  String Unit4_2a = await rootBundle
      .loadString('assets/json/Unidad4/2a_NumberFlashcards.json');
  String Unit4_2b =
      await rootBundle.loadString('assets/json/Unidad4/2b_NumberMC.json');
  String Unit4_3 =
      await rootBundle.loadString('assets/json/Unidad4/3_SerRule4.json');
  String Unit4_4 =
      await rootBundle.loadString('assets/json/Unidad4/4_SerRule5.json');
  String Unit4_5 = await rootBundle
      .loadString('assets/json/Unidad4/5_ImportantWordsPhrases4.json');
  String Unit4_6a =
      await rootBundle.loadString('assets/json/Unidad4/6a_Dialogue4.json');
  String Unit4_6b =
      await rootBundle.loadString('assets/json/Unidad4/6b_Dialogue4MC.json');
  String Unit4_7 = await rootBundle
      .loadString('assets/json/Unidad4/7_FullUnit4Practice.json');

  // Chapter 5 json upload
  String Unit5_1 =
      await rootBundle.loadString('assets/json/Unidad5/1_Unit5Vocab.json');
  String Unit5_2 =
      await rootBundle.loadString('assets/json/Unidad5/2_SerRule6.json');
  String Unit5_3 =
      await rootBundle.loadString('assets/json/Unidad5/3_CostCurrency.json');
  String Unit5_4 =
      await rootBundle.loadString('assets/json/Unidad5/4_AllSerRules.json');
  String Unit5_5 = await rootBundle
      .loadString('assets/json/Unidad5/5_FullUnit5Practice.json');

  // Decoding the json files
  Unit1_1r = json.decode(Unit1_1);
  Unit1_2r = json.decode(Unit1_2);
  Unit1_3r = json.decode(Unit1_3);
  Unit1_4r = json.decode(Unit1_4);
  Unit1_5r = json.decode(Unit1_5);
  Unit1_6r = json.decode(Unit1_6);
  Unit1_7r = json.decode(Unit1_7);
  Unit1_8r = json.decode(Unit1_8);
  Unit1_9r = json.decode(Unit1_9);
  Unit1_10r = json.decode(Unit1_10);

  // Chapter 2
  Unit2_1r = json.decode(Unit2_1);
  Unit2_2r = json.decode(Unit2_2);
  Unit2_3r = json.decode(Unit2_3);
  Unit2_4r = json.decode(Unit2_4);
  Unit2_5r = json.decode(Unit2_5);
  Unit2_6r = json.decode(Unit2_6);
  Unit2_7r = json.decode(Unit2_7);

  Unit3_1r = json.decode(Unit3_1);
  Unit3_2r = json.decode(Unit3_2);
  Unit3_3r = json.decode(Unit3_3);
  Unit3_4r = json.decode(Unit3_4);
  Unit3_5r = json.decode(Unit3_5);
  Unit3_6r = json.decode(Unit3_6);
  Unit3_7r = json.decode(Unit3_7);
  Unit3_8r = json.decode(Unit3_8);
  Unit3_9r = json.decode(Unit3_9);

  Unit4_1r = json.decode(Unit4_1);
  Unit4_2ar = json.decode(Unit4_2a);
  Unit4_2br = json.decode(Unit4_2b);
  Unit4_3r = json.decode(Unit4_3);
  Unit4_4r = json.decode(Unit4_4);
  Unit4_5r = json.decode(Unit4_5);
  Unit4_6ar = json.decode(Unit4_6a);
  Unit4_6br = json.decode(Unit4_6b);
  Unit4_7r = json.decode(Unit4_7);

  Unit5_1r = json.decode(Unit5_1);
  Unit5_2r = json.decode(Unit5_2);
  Unit5_3r = json.decode(Unit5_3);
  Unit5_4r = json.decode(Unit5_4);
  Unit5_5r = json.decode(Unit5_5);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIF Language School',
      theme: ThemeData(
        primarySwatch: sifBlue,
      ),
      home: const SplashScreen(),
        onGenerateRoute: NavigationUtils.generateRoute,
    );
  }
}
