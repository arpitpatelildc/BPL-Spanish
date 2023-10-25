import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sif_book/ui/constant.dart';
import 'package:sif_book/ui/singletons_data.dart';
import 'package:sif_book/ui/styles.dart';

import '../widget/LoadingSplashScreen.dart';

class PayWall extends StatefulWidget {
  final Offering offering;

  const PayWall({super.key, required this.offering});

  @override
  State<PayWall> createState() => _PayWallState();
}

class _PayWallState extends State<PayWall> {
  int selectedIndex = 10;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Subscribe',
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/workbook_Cover_1.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "Get access to all our educational content trusted by thousands of people.",
                  style: kTitleTextStyle.copyWith(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                ListView.builder(
                  itemCount: widget.offering.availablePackages.length,
                  itemBuilder: (BuildContext context, int index) {
                    var myProductList = widget.offering.availablePackages;
                    return GestureDetector(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: AnimatedContainer(
                        height: MediaQuery.of(context).size.height * 0.08,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.white,
                          border: Border.all(
                            color: selectedIndex == index
                                ? Colors.black
                                : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        duration: Duration(milliseconds: 250),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      color: selectedIndex == index
                                          ? Colors.green
                                          : Colors.white,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: selectedIndex == index
                                            ? Colors.green
                                            : Colors.grey,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.transparent,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      myProductList[index].storeProduct.title,
                                      style: kTitleTextStyle.copyWith(
                                        color: selectedIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              myProductList[index].storeProduct.priceString,
                              style: kTitleTextStyle.copyWith(
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: ElevatedButton(
                        onPressed: () async {
                          isLoading = true;
                          setState(() {});
                          try {
                            CustomerInfo customerInfo =
                                await Purchases.purchasePackage(widget
                                    .offering.availablePackages[selectedIndex]);
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
                          isLoading = false;
                          setState(() {});
                          Navigator.pop(context, true);
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                        child: Text(
                          "Continue",
                        ),
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     Purchases.restorePurchases();
                    //   },
                    //   child: Text(
                    //     "Restore",
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (isLoading) LoadingSplashScreen(),
      ],
    );
  }
}
