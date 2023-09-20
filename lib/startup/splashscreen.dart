import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sif_book/ui/Authorization/LoginScreen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'units.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool alreadyLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkPref();
  }

  checkPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    alreadyLoggedIn = sharedPreferences.getString("userId") != null ||
            sharedPreferences.getString("userId") != ""
        ? true
        : false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      // navigateRoute: const Chapters(),
      navigateRoute: alreadyLoggedIn ? Units() : LoginScreen(),
      duration: 3500,
      imageSize: 500,
      // imageSrc: 'assets/images/workbook_Cover.JPG',
      imageSrc: 'assets/images/workbook_Cover.png',
      // If we prefer a custom message + animation (must import 'globals.dart')
      // textType: TextType.ColorizeAnimationText,
      // textStyle: TextStyle(fontSize: 30.0),
      // text: "SIF Language School",
      // colors:
      //   [sifBlue, sifGreen, sifOrange],
      backgroundColor: Color.fromRGBO(244, 112, 37, 1.0),
      pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
    );
  }
}
