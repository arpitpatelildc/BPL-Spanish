import 'package:flutter/material.dart';
import 'package:sif_book/startup/globals.dart';
import 'package:sif_book/utils/resources/color_utils.dart';
import '../utils/resources/image_utils.dart';
import 'hexagon_dots/hexagon_dots.dart';

class LoadingSplashScreen extends StatefulWidget {
  const LoadingSplashScreen() : super();

  @override
  _LoadingSplashScreenState createState() => _LoadingSplashScreenState();
}

class _LoadingSplashScreenState extends State<LoadingSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white.withOpacity(0.25),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.width * 0.2,
            child: HexagonDots(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
