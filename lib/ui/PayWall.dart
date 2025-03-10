import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sif_book/ui/constant.dart';
import 'package:sif_book/ui/singletons_data.dart';

import '../utils/resources/dialog_utils.dart';

class Paywall extends StatefulWidget {
  final Offering offering;
  final Function isLoading;

  const Paywall({Key? key, required this.offering, required this.isLoading})
      : super(key: key);

  @override
  _PaywallState createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Wrap(
          children: <Widget>[
            Container(
              height: 70.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('✨ BPL Spanish Premium ✨',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 32, bottom: 16, left: 16.0, right: 16.0),
              child: SizedBox(
                child: Text(
                  'Get access to all our educational content trusted by thousands of people.',
                  style: kDescriptionTextStyle,
                ),
                width: double.infinity,
              ),
            ),
            ListView.builder(
              itemCount: widget.offering.availablePackages.length,
              itemBuilder: (BuildContext context, int index) {
                var myProductList = widget.offering.availablePackages;
                return Card(
                  color: Colors.black,
                  child: ListTile(
                      onTap: () async {
                        widget.isLoading(true);
                        try {
                          CustomerInfo customerInfo =
                              await Purchases.purchasePackage(
                                  widget.offering.availablePackages[index]);
                          EntitlementInfo? entitlement =
                              customerInfo.entitlements.all[entitlementID];
                          appData.entitlementIsActive =
                              entitlement?.isActive ?? false;
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.setBool("isSubscribed", true);
                        } catch (e) {
                          print(e);
                        }
                        widget.isLoading(false);
                        Navigator.pop(context, true);
                      },
                      title: Text(
                        myProductList[index].storeProduct.title,
                        style: kTitleTextStyle,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            myProductList[index].storeProduct.description,
                            style: kDescriptionTextStyle.copyWith(
                                fontSize: kFontSizeSuperSmall),
                          ),
                          Text('7 Days free trial ✨',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      trailing: Text(
                          myProductList[index].storeProduct.priceString,
                          style: kTitleTextStyle)),
                );
              },
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () async {
                      try {
                        CustomerInfo restoredInfo =
                            await Purchases.restorePurchases();
                        restoredInfo.allExpirationDates;
                        Navigator.pop(context);
                        DialogUtils.displayToast("Restore successfully");
                      } on PlatformException catch (e) {
                        Navigator.pop(context);
                        DialogUtils.displayToast("${e.message}");
                      }
                    },
                    child: Text(
                      "Restore Purchase",
                      style: kDescriptionTextStyle,
                    ))
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 0, bottom: 0, left: 16.0, right: 16.0),
              child: SizedBox(
                child: Text(
                  footerText,
                  style: kDescriptionTextStyle,
                ),
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const kColorBar = Colors.black;
const kColorText = Colors.white;
const kColorAccent = Color.fromRGBO(10, 115, 217, 1.0);
const kColorError = Colors.red;
const kColorSuccess = Colors.green;
const kColorNavIcon = Color.fromRGBO(131, 136, 139, 1.0);
const kColorBackground = Color.fromRGBO(30, 28, 33, 1.0);

// Weather Colors
const kWeatherReallyCold = Color.fromRGBO(3, 75, 132, 1);
const kWeatherCold = Color.fromRGBO(0, 39, 96, 1);
const kWeatherCloudy = Color.fromRGBO(51, 0, 58, 1);
const kWeatherSunny = Color.fromRGBO(212, 70, 62, 1);
const kWeatherHot = Color.fromRGBO(181, 0, 58, 1);
const kWeatherReallyHot = Color.fromRGBO(204, 0, 58, 1);

// Text Styles
const kFontSizeSuperSmall = 10.0;
const kFontSizeNormal = 16.0;
const kFontSizeMedium = 18.0;
const kFontSizeLarge = 96.0;

const kDescriptionTextStyle = TextStyle(
  color: kColorText,
  fontWeight: FontWeight.normal,
  fontSize: kFontSizeNormal,
);

const kTitleTextStyle = TextStyle(
  color: kColorText,
  fontWeight: FontWeight.bold,
  fontSize: kFontSizeMedium,
);

// Inputs
const kButtonRadius = 10.0;

const userInputDecoration = InputDecoration(
  fillColor: Colors.black,
  filled: true,
  hintText: 'Enter App User ID',
  hintStyle: TextStyle(color: kColorText),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(kButtonRadius)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 0),
    borderRadius: BorderRadius.all(Radius.circular(kButtonRadius)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(kButtonRadius)),
  ),
);
