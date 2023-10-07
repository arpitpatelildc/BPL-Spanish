// String class for App
import 'package:flutter/cupertino.dart';

final navigatorKeyMain = GlobalKey<NavigatorState>();

class AppStrings {
  static const String email = "Email address";
  static const String password = "Password";
  static const String firstName = "First name";
  static const String surName = "Surname";
  static const String forgotPassword = "Forgot Password";
  static const String title8Characters = "6 Characters minimum";
  static const String signupWithEmail = "Sign up with email";
  static const String errorEmail = "Enter your email address";
  static const String errorPassword = "Enter your password";
  static const String errorValidPassword = "Password Must be min 8 characters.";
  static const String errorFirstname = "Enter your first name";
  static const String errorSurname = "Enter your surname";
  static const String errorValidEmail = "Please enter valid email";
  static const String errorUserNotFound = "User not found";
  static const String errorWrongPassword = "You entered wrong password";
  static const String errorWeakPassword = "The password provided is too weak.";
  static const String errorEmailExist =
      "Email already registered, try another email.";
  static const String btnLogin = "Login";
  static const String btnForgotPwd = "Send Re-set Password Link";
  static const String btnSignup = "Sign up";
  static const String erroInternetconnection = "Internet not available";
  static const String errorMSG= "Something went wrong.";
}

// Preference variableKey for App
class AppPrefereceKey {
  static const String userId = "userId";
  static const String userSqlId = "userSqlId";
  static const String email = "Email";
  static const String firstname = "FirstName";
  static const String surname = "SurName";
  static const String phoneNo = "phoneNo";
  static const String lastLoginTimestamp = "lastLoginTimestamp";
  static const String subscriptionStatus = "subscriptionStatus";
  static const String subscriptionPackages = "subscriptionPackages";
  static const String subscriptionPlatform = "subscriptionPlatform";
  static const String subscriptionCancelAt = 'subscriptionCancelAt';
  static const String subscriptionID = "subscriptionID";
  static const String stripeId = "stripeId";
  static const String subscriptionExpiredDate = "subscriptionExpiredDate";
  static const String subscriptionPurchaseDate = "subscriptionPurchaseDate";
  static const String productIdentifier = "productIdentifier";
  static const String password = "Password";
  static const String packageName = "packageName";
  static const String prefixUrl = "prefixUrl";
  static const String appstoreId = "appstoreId";
  static const String dynamicLinkData = "dynamicLinkData";
  static const String isOpenApp = 'isOpenApp';
  static const String isGYMUser = 'isGYMUser';
  static const String clientId = 'clientId';
  static const String GYMName = 'GYMName';
  static const String latestAppVersion = "latestAppVersion";
  static const String currentAppVersion = "currentAppVersion";
  static const String minAppVersion = "minAppVersion";
  static const String lastDisplayTime = "lastDisplayTime";
  static const String videoModel = "videoModel";
  static const String alarmIndex = 'alarmIndex';
  static const String notificationData = 'notificationData';

  static const String bodyPartProgramIndexList = 'bodyPartProgramIndexList';
  static const String bodyPartWorkoutIndexList = 'bodyPartWorkoutIndexList';
}

// FontFamily for App
class AppFontFamily {
  static const String appFont = "WorkSans";
  static const String appFontSemiBold = "WorkSans-SemiBold";
  static const String appFontRegular = "WorkSans-Regular";
  static const String appFontMedium = "WorkSans-Medium";
  static const String appFontBold = "WorkSans-Bold";
}

// navigation routes for app
class AppRoutes {
  static const String routeLogin = 'routeLogin';
  static const String routeForgotPassword = 'routeForgotPassword';
  static const String routeSignUp = 'routeSignUp';
  static const String routeUnit = 'routeUnit';
}

class Listout {
   final String? name;
   final String? searchTag;
   bool? isselected;

  Listout({ this.name, this.searchTag,  this.isselected});
}

class SubscriptionPackages {
  List<Listout> subscriptionPackagesList = [
    Listout(name: "lifetime", searchTag: "LifeTime", isselected: false),
    Listout(name: "recovr_yearly", searchTag: "Yearly", isselected: false),
    Listout(name: "recovr_HalfYearly", searchTag: "Yearly", isselected: false),
    Listout(name: "web_recovr_yearly", searchTag: "Yearly", isselected: false),
    Listout(name: "prod_MBieh5IRsGavt9", searchTag: "Yearly", isselected: false),
    Listout(name: "12", searchTag: "Yearly", isselected: false),
    Listout(name: "recovr_6month", searchTag: "Six Month", isselected: false),
    Listout(name: "recovr_HalfYearly", searchTag: "Six Month", isselected: false),
    Listout(name: "web_recovr_6month", searchTag: "Six Month", isselected: false),
    Listout(name: "prod_MBickufeY3J0Mc", searchTag: "Six Month", isselected: false),
    Listout(name: "prod_Lo5oS9VdlkH87D", searchTag: "Six Month", isselected: false),
    Listout(name: "three", searchTag: "Three Month", isselected: false),
    Listout(name: "prod_MSXIoVf4VeGk8Y", searchTag: "Three Month", isselected: false),
    Listout(name: "prod_MQJx6jSoZFhhSp", searchTag: "Three Month", isselected: false),
    Listout(name: "recovr_monthly", searchTag: "Monthly", isselected: false),
    Listout(name: "monthly", searchTag: "Monthly", isselected: false),
    Listout(name: "recovr_OneMonth", searchTag: "Monthly", isselected: false),
    Listout(name: "web_recovr_monthly", searchTag: "Monthly", isselected: false),
    Listout(name: "prod_MAb0wot6GZHXyu", searchTag: "Monthly", isselected: false),
    Listout(name: "prod_Lo5iX2TODlYwIG", searchTag: "Monthly", isselected: false),
    Listout(name: "two", searchTag: "Two Month", isselected: false),
    Listout(name: "weekly", searchTag: "Weekly", isselected: false),
  ];
}