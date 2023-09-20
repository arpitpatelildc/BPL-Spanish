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
            pageBuilder: (context, animation, secondaryAnimation) =>
                Units());

      /// Subscription
      // case AppRoutes.routeSubscription:
      //   return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => SubscriptionScreen(
      //           isfromCommit: args[NavigationParams.isfromCommit],
      //           programList: args[NavigationParams.userProgramWeek] ));
    }
  }

  static void pushReplacement(BuildContext context, String routeName,
      {Object? arguments}) {
    // appContext = context;
    Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> push(BuildContext context, String routeName,
      {Object? arguments}) {
    // appContext = context;
    return Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static void pop(BuildContext context, {dynamic args}) {
    // appContext = context;
    Navigator.of(context).pop(args);
  }

  static Future<dynamic> pushAndRemoveUntil(
      BuildContext context, String routeName,
      {Object? arguments}) {
    // appContext = context;
    return Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (route) => false,
        arguments: arguments);
  }
}

class NavigationParams {
  static const String userprogram = "userprogram";
  static const String userProgramWeek = "userProgramWeek";
  static const String programStatus = "programStatus";

  static const String program = "program";
  static const String programWeek = "programWeek";
  static const String programWeekWorkout = "programWeekWorkout";
  static const String programWorkouts = "programWorkouts";
  static const String programWeekWorkoutParts = "programWeekWorkoutParts";
  static const String programWeekWorkoutPartsExerciseCount =
      "programWeekWorkoutPartsExerciseCount";
  static const String programWeekWorkoutPartsExercise =
      "programWeekWorkoutPartsExercise";
  static const String programWeekWorkoutPartsExerciseSlots =
      "programWeekWorkoutPartsExerciseSlots";
  static const String ExerciseRepeat = "ExerciseRepeat";
  static const String isWorkoutOverviewFrom = "isWorkoutOverviewFrom";
  static const String isExercisePageFrom = "isExercisePageFrom";
  static const String workoutPartRepeat = "workoutPartRepeat";
  static const String isReload = "isReload";
  static const String isfromCommit = "isfromCommit";
  static const String fromSubscribe = "isSubscribe";
  static const String programURL = "programURL";
  static const String assessmentID = "assessmentID";
  static const String activeCampaignAnswer = "activeCampaignAnswer";
  static const String fromEdit = "fromEdit";
  static const String isFrom = "isFrom";
  static const String isProgram = "isProgram";
  static const String isLike = "isLike";
  static const String title = "title";
  static const String url = "url";
  static const String pdfPath = "pdfPath";
  static const String programName = "programName";
  static const String programId = "programId";
  static const String weekId = "weekId";
  static const String workoutsName = "workoutsName";
  static const String workoutId = "workoutsId";
  static const String workoutStatus = "workoutStatus";
  static const String tabIndex = "tabIndex";
  static const String linkid = "linkid";
  static const String bodypartListIndex = "bodypartListIndex";
  static const String workoutListIndex = "workoutListIndex";
  static const String appleUserId = "appleUserId";
  static const String appleUserUId = "appleUserUId";
  static const String isFromApple = "isFromApple";
  static const String firstName = 'firstName';
  static const String surname = 'surname';
  static const String email = 'email';
  static const String password = 'password';
  static const String bodyPart = 'bodyPart';
  static const String dataCallback = 'dataCallback';
  static const String selectedDate = 'selectedDate';
  static const String bodyScore = 'bodyScore';
}
