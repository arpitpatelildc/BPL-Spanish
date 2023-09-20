// String class for App
import 'package:flutter/cupertino.dart';

final navigatorKeyMain = GlobalKey<NavigatorState>();

class AppStrings {
  static const String appName = "recovr";
  static const String email = "Email address";
  static const String password = "Password";
  static const String firstName = "First name";
  static const String surName = "Surname";
  static const String phone = "Phone Number";
  static const String alreadyAccount = "Already have an account?";
  static const String here = " Login Here";
  static const String forgotPassword = "Forgot Password";
  static const String termsConditions =
      "By signing up with Recovr you agree to our ";
  static const String title8Characters = "6 Characters minimum";
  static const String title10Digit = "10 digits minimum";
  static const String discoverProgram = "Or, discover a workout here";
  static const String termsService = "Terms of Service";
  static const String privacyPolicy = "Privacy Policy";
  static const String faq = "FAQ";
  static const String contactUs = "Contact us";
  static const String support = "Support";
  static const String signupWithEmail = "Sign up with email";
  static const String signupWithApple = "Sign up with Apple";
  static const String addProfile = "Add Profile";
  static const String welcomeBack = "Welcome back";
  static const String filter = "Filter";
  static const String shareWithFriend = "Share With Friends!";
  static const String account = "Account";
  static const String editProfile = "Edit Profile";
  static const String editPassword = "Change Password";
  static const String signupSuccess = "Register successfully";
  static const String logout = "Logout";
  static const String errorEmail = "Enter your email address";
  static const String errorPassword = "Enter your password";
  static const String errorPhone = "Enter your phone number";
  static const String errorValidPassword = "Password Must be min 8 characters.";
  static const String errorValidPhone = "Phone number Must be min 10 digit.";
  static const String errorValidPhoneDigit = "Phone number Must be in digits.";
  static const String errorFirstname = "Enter your first name";
  static const String errorSurname = "Enter your surname";
  static const String errorValidEmail = "Please enter valid email";
  static const String errorUserNotFound = "User not found";
  static const String errorWrongPassword = "You entered wrong password";
  static const String errorWeakPassword = "The password provided is too weak.";
  static const String errorEmailExist =
      "Email already registered, try another email.";
  static const String errorEmailBlank = "Email is blank";
  static const String errorCouponCode = 'Enter your coupon code here';

  static const String deleteAccountTitle =
      'Deleting your Recovr account will remove all of your history on the app.';
  static const String btnDeleteAcc = 'Delete account';
  static const String btnBackArea = 'Back Area';
  static const String btnFrontArea = 'Front Area';
  static const String specificArea = 'Which specific area?';
  static const String btnNext = 'Next';
  static const String btnCancel = 'Cancel';
  static const String subscription = 'Subscription';
  static const String startJourney =
      'Your Recovr journey starts here! The first 7 \ndays are free.';
  static const String yearly = "Yearly";
  static const String halfYearly = "Half Yearly";
  static const String monthly = "Monthly";
  static const String apply = 'Apply';
  static const String subscribe = 'Subscribe';
  static const String restorepurchase = 'Restore Purchase';
  static const String btnLogin = "Login";
  static const String btnForgotPwd = "Send Re-set Password Link";
  static const String btnSignup = "Sign up";
  static const String btnSave = "Save";
  static const String btnSavechanges = "Save Changes";

///
  static const String pleaseTryAgain = "Please try again";

  static const String erroInternetconnection = "Internet not available";
  static const String errorMSG= "Something went wrong.";
  static const String errorSubsciption =
      "Your current subscription has been expired. Please subscribe with a plan.";
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
  static const String routeOnboarding = 'routeOnboarding';
  static const String routeTabbar = 'routeTabbar';
  static const String routeLaunch = 'routeLaunch';
  static const String routeLogin = 'routeLogin';
  static const String routeForgotPassword = 'routeForgotPassword';
  static const String routeSignUp = 'routeSignUp';
  static const String routeUnit = 'routeUnit';
  static const String routeQuestion = 'routeQuestion';
  static const String routeSubscription = 'routeSubscription';
  static const String routeAccount = 'routeAccount';
  static const String routeWebview = 'routeWebview';
  static const String routePdfview = 'routePdfview';
  static const String routeSubscriptionview = 'routeSubscriptionview';
  static const String routeSignupQuestionScreen = 'routeSignupQuestionScreen';
  static const String routeCompleteWorkOut = 'routeCompleteWorkOut';

  /// Home tabbar
  static const String routeHome = 'routeHome';
  static const String routeHomeDetails = 'routeHomeDetails';
  static const String routeCompletedProgram = 'routeCompletedProgram';
  static const String routeExercisePage = 'routeExercisePage';
  static const String routeWorkoutOverviewScreen = 'routeWorkoutOverviewScreen';
  static const String routeWorkoutInstruction = 'routeWorkoutInstruction';
  static const String routeVitalsTrackerScreen = 'routeVitalsTrackerScreen';
  static const String routeVitalsMonthlyTrackerScreen = 'routeVitalsMonthlyTrackerScreen';
  static const String routeCongratulationsScreen = 'routeCongratulationsScreen';
  static const String routeFullScreenAlertDialog = 'routeFullScreenAlertDialog';

  /// program tabbar

  static const String routeMyPrograms = 'routeMyPrograms';
  static const String routeQuickWorkoutOverviewScreen = 'routeQuickWorkoutOverviewScreen';
  static const String routeQuickWorkoutExercisePage = 'routeQuickWorkoutExercisePage';
  static const String routeCompleteQuickWorkout = 'routeCompleteQuickWorkout';
  static const String routeQuickWorkoutInstruction = 'routeQuickWorkoutInstruction';
  static const String routeFilterProgram = 'routeFilterProgram';
  static const String routeFilterWorkout = 'routeFilterWorkout';
  static const String routeReviewAssessment = 'routeReviewAssessment';
  static const String routeAssessmentTreatment = 'routeAssessmentTreatment';
  static const String routeProgramDetails = 'routeProgramDetails';


}

class TabbarBar {
  static int tabIndex = 0;
  static bool isfromQuestion = false;
  static List<String> assessmentResult = [];

  static String anonymousId="";
  static String tabbarFlow = "Home";
  static bool reloadHome = false;
  static String partTimer="";
  static bool workoutDetail=false;
  static String? programURL="";
  static String videoPrefix = '' ;
  static String mixPanelToken = "";
  static String packageName='';
  static String? notificationPayload = '';
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

class DevApp {
  //App info
  static String packageName = "staging.lift.recovr";
  static String appstoreId = "1595556793";
  static String dynamicLinkPrefixUrl = "recovrstaging.page.link";

  static String programURL="https://transdirect.plutustec.in";
 // static String recovrBaseURL = "https://api-dev.recovr.com/api";
  ///https://api-dev.recovr.com/api/workout-time

  ///  https://rehab.recovr.com/?amv=0&ibi=com.lift.recovr&
  ///  isi=1610311343&imv=0
  ///  &apn=com.lift.recovr&link=https%3A%2F%2Frecovrproduction.page.link%2FprogramData%3Fid%3DZRHY6e0zrZNJmEJHw9Xk

  // revenueCatApi keys
  static String revenuecatAndroidKey = "goog_tTSYbwRXjMbLGlAPRFGYjoZSwug";
  static String revenuecatiOSKey = "appl_jqbxzBdNfycOvgXRtlVqcDwPATd";

  // Shakebugs keys
  static String shakebugsclientid = "IqA6O85NwjLvyeB2cvsGMX7IBvxObBCDpOLkNaBM";
  static String shakebugsclientsecret = "6yxD1020gvO3iafD1gbpKTRw39SLQJSwQQBJy9YFZYe5GWx8AhnUXpU";
  static String stripeKey = "sk_test_51KMnalGSLZI5qKJB7ANMSnomf1xE8BcIIBotP1mMtpnpiCj0DMVVhlBrLDX3Eg20CURzSjUcR9GhTn0NTbNwbcxG00syBBR6Wi";
  static String mixpanelKey = 'eb238646f25d6f2478be0e2b7284eba7';

  static String recovrBaseURL = 'https://recovr-stag-api-iz2o7.ondigitalocean.app/api';
}


class ProdApp {
  //App info
  static String packageName = "com.lift.recovr";
  static String appstoreId = "1610311343";
  static String dynamicLinkPrefixUrl = "rehab.recovr.com";
  //static String dynamicLinkPrefixUrl = "recovrproduction.page.link";
  static String programURL="https://recovr.com";
  //static String recovrBaseURL = "https://api.recovr.com/api";

  // Segment keys
  static String segementAndroidKey = "JAg75ADCm7sZBCXSfJMfauWzndbocd7F";
  static String segementiOSKey = "VI2APPxsV4OinUlGxRehi0sU2eARnfFJ";

  // intercom keys
  static String intercomPrivateKey = "n38n4eje";
  static String intercomAndroidApiKey =
      "android_sdk-e218b1e40bacf3ee26fb90ffefe2b895857c4fe9";
  static String intercomiOSApiKey =
      "ios_sdk-645a05fbbf50980f9ffd41366472b2d0ea605ae0";

  // revenueCatApi keys
  static String revenuecatAndroidKey = "goog_UUUJpYREfQSirCGdbPUQDudjWbj";
  static String revenuecatiOSKey = "appl_JAOCBKTQVCRJxtLpKKdEndwHTFY";

  // Shakebugs keys
  static String shakebugsclientid = "IqA6O85NwjLvyeB2cvsGMX7IBvxObBCDpOLkNaBM";
  static String shakebugsclientsecret = "6yxD1020gvO3iafD1gbpKTRw39SLQJSwQQBJy9YFZYe5GWx8AhnUXpU";

  static String stripeKey = "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";
  static String mixpanelKey = '48b202249a640898d57a6ab3c61432ec';


  static String recovrBaseURL = 'https://dolphin-app-sbkc2.ondigitalocean.app/api';
}