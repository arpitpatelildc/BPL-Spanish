import 'package:flutter/material.dart';
import 'package:sif_book/constant/Constant.dart';
import 'package:sif_book/startup/units.dart';
import 'package:sif_book/ui/Authorization/ForgotPasswordScreen.dart';
import 'package:sif_book/ui/Authorization/LoginScreen.dart';
import 'package:sif_book/ui/Authorization/SignupScreen.dart';

class NavigationUtils {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final Map<String, dynamic> args =
        settings.arguments as Map<String, dynamic>;
    switch (settings.name) {
      /// authorization
      case AppRoutes.routeLogin:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                LoginScreen());
      case AppRoutes.routeForgotPassword:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ForgotPasswordScreen());
      case AppRoutes.routeSignUp:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                SignupScreen());
      case AppRoutes.routeUnit:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => Units());
    }
  }

  static void pushReplacement(BuildContext context, String routeName,
      {Object? arguments}) {
    Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> push(BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static void pop(BuildContext context, {dynamic args}) {
    Navigator.of(context).pop(args);
  }

  static Future<dynamic> pushAndRemoveUntil(
      BuildContext context, String routeName,
      {Object? arguments}) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }
}