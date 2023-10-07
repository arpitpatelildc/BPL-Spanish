// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
const appleAPIKey = "appl_eigPfJKxeAgerJigBjgjWaMKSqL";
const googleAPIKey = "goog_chvuEOOGiyLeXNKklozahfXTQWN";
//
// class PurchaseApi {
//   static Future<void> initPlatformState(
//       {String? iosKey, String? androidKey, String? email}) async {
//     PurchasesConfiguration? configuration;
//     await Purchases.setLogLevel(LogLevel.debug);
//     if (email != null && email != "") {
//       if (Platform.isIOS) {
//         configuration = PurchasesConfiguration(iosKey!);
//         configuration.appUserID = email;
//          await Purchases.setup(iosKey!, appUserId: email);
//       } else {
//         configuration = PurchasesConfiguration(androidKey!);
//         configuration.appUserID = email;
//         await Purchases.setup(androidKey!, appUserId: email);
//       }
//     } else {
//       if (Platform.isIOS) {
//         configuration = PurchasesConfiguration(iosKey!);
//         //  await Purchases.setup(iosKey!);
//       } else {
//         configuration = PurchasesConfiguration(androidKey!);
//         //   await Purchases.setup(androidKey!);
//       }
//     }
//     await Purchases.configure(configuration);
//   }
//
//   static Future<List<Offering>?>? fetchOffers() async {
//     try {
//       final offering = await Purchases.getOfferings();
//       final current = offering.current;
//
//       return current == null ? [] : [current];
//     } on PlatformException catch (e) {
//       //  debugPrint("fetchoffers error: $e");
//       return [];
//     }
//   }
//
//   // static Future<String?>? applyCouponCode(Package package, BuildContext context,
//   //     StoreProductDiscount discount) async {
//   //   debugPrint('===== applyCouponCode called ===== ${package.storeProduct}');
//   //
//   //   try {
//   //     final PromotionalOffer discountedProduct =
//   //         await Purchases.getPromotionalOffer(
//   //       package.storeProduct,
//   //       discount,
//   //     );
//   //     debugPrint('applyCouponCode 0 ====$discountedProduct');
//   //     debugPrint('applyCouponCode 00 ====${jsonEncode(discountedProduct)}');
//   //
//   //     CustomerInfo purchaserInfo =
//   //         await Purchases.purchaseDiscountedPackage(package, discountedProduct);
//   //     debugPrint('applyCouponCode 11 ====${jsonEncode(purchaserInfo)}');
//   //     var accessible_id = "All_Features";
//   //     var isPro = purchaserInfo.entitlements.all[accessible_id]?.isActive;
//   //     if (isPro!) {
//   //       SharedPreferences prefs = await SharedPreferences.getInstance();
//   //       getSubscriptionStatus(context, "fromPurchase");
//   //       return "success";
//   //     } else {
//   //       return null;
//   //     }
//   //   } on PlatformException catch (e) {
//   //     debugPrint('applyCouponCode ==== error ====$e');
//   //     return "${e.message}";
//   //   }
//   // }
//
//   static Future<String?>? makePurchases(
//       Package package, BuildContext context) async {
//     String msg = '';
//       try {
//         CustomerInfo purchaserInfo;
//
//         debugPrint('===== makePurchases called 00===== ${package.identifier}');
//         if (getString(AppPrefereceKey.productIdentifier) != null &&
//             getString(AppPrefereceKey.productIdentifier)!.length > 4 &&
//             Platform.isAndroid) {
//           debugPrint(
//               '===== makePurchases called 11===== ${package.identifier}');
//           purchaserInfo = await Purchases.purchaseStoreProduct(
//               package.storeProduct,
//               googleProductChangeInfo: GoogleProductChangeInfo(
//                   getString(AppPrefereceKey.productIdentifier)!),
//               googleIsPersonalizedPrice: false);
//         } else {
//           debugPrint(
//               '===== makePurchases called 22===== ${package.identifier}');
//           purchaserInfo = await Purchases.purchasePackage(package);
//         }
//
//         var accessible_id = "All_Features";
//         var isPro = purchaserInfo.entitlements.all[accessible_id]?.isActive;
//         if (isPro!) {
//           // SharedPreferences prefs = await SharedPreferences.getInstance();
//           // prefs.setString(AppPrefereceKey.subscriptionPlatform,
//           //     Platform.operatingSystem);
//           getSubscriptionStatus(context, "fromPurchase");
//           return "success";
//         }
//       } on PlatformException catch (e) {
//         return "${e.message}";
//       }
//   }
//
//   static Future<void> getSubscriptionStatus(
//       BuildContext ctx, String isFrom) async {
//     // SharedPreferences? prefs = await SharedPreferences.getInstance();
//       try {
//         CustomerInfo purchaserInfo = await Purchases.getCustomerInfo();
//         print('getSubscriptionStatus purchaserInfo ====$purchaserInfo');
//       } catch (e){
//         print(e);
//       }
//   }
//
//   static Future<String?> restoredPurchases(BuildContext context) async {
//       try {
//         // SharedPreferences prefs = await SharedPreferences.getInstance();
//         // prefs.setString(AppPrefereceKey.subscriptionPlatform,
//         //     Platform.operatingSystem);
//         getSubscriptionStatus(context, "fromPurchase");
//         CustomerInfo restoredInfo = await Purchases.restorePurchases();
//         restoredInfo.allExpirationDates;
//         return "success";
//       } on PlatformException catch (e) {
//         //  debugPrint("restore purchase un success....");
//         return e.message!;
//       }
//   }
//
//   // static void isFromPurchase() {
//   //   //  debugPrint("fromPurchase============");
//   //   String packageId = "", amount = "";
//   //   int platform = 0;
//   //   Map<String, dynamic> activeCampaignBody, setPurchaseDetail;
//   //   activeCampaignBody = {
//   //     "email": "${getString(AppPrefereceKey.email)}",
//   //     "first_name": "${getString(AppPrefereceKey.firstname)}",
//   //     "last_name": "${getString(AppPrefereceKey.surname)}",
//   //     "tags": "purchase",
//   //   };
//   //   ApiManager().userActiveCampaignAssessment(activeCampaignBody);
//   //
//   //   //     await ApiManager().userAssessmentDetailsPurchaseCount();
//   //   activeCampaignBody = {
//   //     "email": "${getString(AppPrefereceKey.email)}",
//   //     "first_name": "${getString(AppPrefereceKey.firstname)}",
//   //     "last_name": "${getString(AppPrefereceKey.surname)}",
//   //     "tags": "App User"
//   //   };
//   //   ApiManager().userActiveCampaignAssessment(activeCampaignBody);
//   //
//   //   if (getString(AppPrefereceKey.subscriptionID) != null &&
//   //       getString(AppPrefereceKey.subscriptionID) != "") {
//   //     packageId = getString(AppPrefereceKey.subscriptionID).toString();
//   //   }
//   //   if (packageId.toString().trim().toLowerCase().contains("lifetime")) {
//   //     amount = 'Lifetime';
//   //   } else {
//   //     if (packageId.toString().trim().contains("recovr_6month") ||
//   //         packageId.toString().trim().contains("recovr_6_months") ||
//   //         packageId.toString().trim().contains("recovr_HalfYearly") ||
//   //         packageId.toString().trim().contains("web_recovr_6month") ||
//   //         packageId.toString().trim().contains("prod_MBickufeY3J0Mc") ||
//   //         packageId.toString().trim().contains("prod_Lo5oS9VdlkH87D") ||
//   //         packageId.toString().trim().contains("com.lift.reovr.Half_Yearly") ||
//   //         packageId
//   //             .toString()
//   //             .trim()
//   //             .contains("com.lift.recovr.Premium_Half_Yearly") ||
//   //         packageId.toString().trim().contains("com.lift.recovr_halfyearly") ||
//   //         packageId
//   //             .toString()
//   //             .trim()
//   //             .contains("com.lift.recovr.premium_half_yearly")) {
//   //       amount = 'Six Month';
//   //     } else if (packageId.toString().trim().contains("recovr_yearly") ||
//   //         packageId.toString().trim().contains("recovr_12_months") ||
//   //         packageId.toString().trim().contains("web_recovr_yearly") ||
//   //         packageId.toString().trim().contains("prod_MBieh5IRsGavt9") ||
//   //         packageId.toString().trim().contains("12") ||
//   //         packageId.toString().trim().contains("Yearly") ||
//   //         packageId.toString().trim() == "com.lift.recovr.Yearly" ||
//   //         packageId.toString().trim() == "com.lift.recovr_yearly" ||
//   //         packageId.toString().trim() == "com.lift.recovr.Premium_Yearly" ||
//   //         packageId.toString().trim() == "com.lift.recovr.premium_yearly") {
//   //       amount = 'Yearly';
//   //     } else if (packageId.toString().trim().contains("three") ||
//   //         packageId.toString().trim().contains("prod_MSXIoVf4VeGk8Y") ||
//   //         packageId.toString().trim().contains("prod_MQJx6jSoZFhhSp")) {
//   //       amount = 'Three Month';
//   //     } else if (packageId.toString().trim().contains("recovr_monthly") ||
//   //         packageId.toString().trim().contains("monthly_29.99") ||
//   //         packageId.toString().trim().contains("monthly") ||
//   //         packageId.toString().trim().contains("recovr_OneMonth") ||
//   //         packageId.toString().trim().contains("web_recovr_monthly") ||
//   //         packageId.toString().trim().contains("prod_MAb0wot6GZHXyu") ||
//   //         packageId.toString().trim().contains("prod_Lo5iX2TODlYwIG") ||
//   //         packageId.toString().trim().contains("com.lift.recovr.1_Month") ||
//   //         packageId.toString().trim().contains("com.lift.recovr_onemonth") ||
//   //         packageId
//   //             .toString()
//   //             .trim()
//   //             .contains("com.lift.recovr.Premium_Month") ||
//   //         packageId
//   //             .toString()
//   //             .trim()
//   //             .contains("com.lift.recovr.premium_month") ||
//   //         packageId.toString().trim() == ("prod_OL9Ynt3ggqKzXk") ||
//   //         packageId.toString().trim() == ("prod_OO9CD2N66OhxTt")) {
//   //       amount = 'Monthly';
//   //     } else if (packageId.toString().trim().contains("two") ||
//   //         packageId.toString().trim().contains("2")) {
//   //       amount = 'Two Month';
//   //     } else if (packageId.toString().trim().contains("weekly")) {
//   //       amount = 'Weekly';
//   //     } else {
//   //       amount = packageId;
//   //     }
//   //   }
//   //
//   //   // if (amount.trim().toString().isNotEmpty && amount.trim().toString() != "") {
//   //   //   activeCampaignBody = {
//   //   //     "email": "${getString(AppPrefereceKey.email)}",
//   //   //     "first_name": "${getString(AppPrefereceKey.firstname)}",
//   //   //     "last_name": "${getString(AppPrefereceKey.surname)}",
//   //   //     "tags": amount
//   //   //   };
//   //   //
//   //   //   if (Platform.isAndroid) {
//   //   //     platform = 1; //Android
//   //   //   } else {
//   //   //     platform = 2; //iOSc
//   //   //   }
//   //     // ApiManager().userActiveCampaignAssessment(activeCampaignBody);
//   //     // setPurchaseDetail = {
//   //     //   "user_id": int.parse('${getString(AppPrefereceKey.userSqlId)}'),
//   //     //   "subscription_identifier":
//   //     //       "${getString(AppPrefereceKey.productIdentifier)}",
//   //     //   "start_date":
//   //     //       DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.parse(getString(AppPrefereceKey.subscriptionPurchaseDate) ?? "")),
//   //     //   "end_date":
//   //     //       DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.parse(getString(AppPrefereceKey.subscriptionExpiredDate) ?? "")),
//   //     //   "platform": platform,
//   //     //   // "cancel_date":"2023-08-01 09:03:00" // on cancel subscription
//   //     // };
//   //     // ApiManager_SQL().addUserSubscription(setPurchaseDetail);
//   //     // ApiManager_SQL().registerUserInSQL(setPurchaseDetail);
//   //   }
//   // }
// }
