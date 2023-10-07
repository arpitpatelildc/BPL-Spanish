import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sif_book/constant/Constant.dart';
import 'package:sif_book/ui/SubscribeScreen.dart';
import 'package:sif_book/ui/constant.dart';
import 'package:sif_book/ui/native_dialog.dart';
import 'package:sif_book/ui/paywall.dart';
import 'package:sif_book/ui/singletons_data.dart';
import 'package:sif_book/ui/store_config.dart';
import 'package:sif_book/ui/styles.dart';
import 'package:sif_book/utils/route/navigation.dart';
import '../units/unit1.dart';
import '../units/unit2.dart';
import '../units/unit3.dart';
import '../units/unit4.dart';
import '../units/unit5.dart';
import 'globals.dart';
import '../units/neurosciencepage.dart';

class Units extends StatefulWidget {
  const Units({Key? key}) : super(key: key);

  @override
  State<Units> createState() => _UnitsState();
}

class _UnitsState extends State<Units> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
    prefCheck();
  }

  Future<void> initPlatformState() async {

    // Enable debug logs before calling `configure`.
    await Purchases.setLogLevel(LogLevel.debug);

    /*
    - appUserID is nil, so an anonymous ID will be generated automatically by the Purchases SDK. Read more about Identifying Users here: https://docs.revenuecat.com/docs/user-ids

    - observerMode is false, so Purchases will automatically handle finishing transactions. Read more about Observer Mode here: https://docs.revenuecat.com/docs/observer-mode
    */
    var pref = await SharedPreferences.getInstance();

    var email =pref.getString("email");
    PurchasesConfiguration configuration;
    if (StoreConfig.isForAmazonAppstore()) {
      configuration = AmazonConfiguration(StoreConfig.instance.apiKey)
        ..appUserID = email
        ..observerMode = false;
    } else {
      configuration = PurchasesConfiguration(StoreConfig.instance.apiKey)
        ..appUserID = email
        ..observerMode = false;
    }
    await Purchases.configure(configuration);

    appData.appUserID = await Purchases.appUserID;

    Purchases.addCustomerInfoUpdateListener((customerInfo) async {
      appData.appUserID = await Purchases.appUserID;

      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      EntitlementInfo? entitlement =
      customerInfo.entitlements.all[entitlementID];
      appData.entitlementIsActive = entitlement?.isActive ?? false;

      setState(() {});
    });
  }

  String email = "sifBPL@gmail.com";

  prefCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    email = pref.getString("email") ?? "sifBPL@gmail.com";
    setState(() {});
  }

  @override
  // The widget being built here is the entire screen, and the body: ListWidget() creates an inner widget that is the list of Units (ToC).
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Unit Selection',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: headerFontSize),
        ),
        toolbarHeight: headerHeight,
        actions: [
          IconButton(
            onPressed: () {
              _showSignOutBottomSheet(context);
            },
            icon: Icon(
              Icons.settings,
              size: headerFontSize,
            ),
          ),
        ],
      ),
      body: Center(
        child: Scaffold(
            body: Scrollbar(
          isAlwaysShown: true,
          child: ListWidget(),
          thickness: 10,
          radius: Radius.circular(5),
        )),
      ),
      floatingActionButton: Row(children: [
        FloatingActionButton(
          heroTag: "zoomOut",
          mini: true,
          onPressed: () {
            fontSizeAdjust(false);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => super.widget));
          },
          child: Icon(
            Icons.zoom_out,
            size: 32.0,
          ),
        ),
        FloatingActionButton(
          heroTag: "zoomIn",
          mini: true,
          onPressed: () {
            fontSizeAdjust(true);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => super.widget));
          },
          child: Icon(
            Icons.zoom_in,
            size: 32.0,
          ),
        ),
      ]),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniStartDocked,
    );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _showSignOutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: sifBlue.withOpacity(0.2),
                    spreadRadius: 10,
                    blurRadius: 25,
                  )
                ]),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    "assets/images/BPL_Logo.jpeg",
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                email,
                style: TextStyle(
                  fontSize: subtitleFontSize,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Text(
                'Sign Out Confirmation',
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Are you sure you want to sign out?',
                style: TextStyle(fontSize: subtitleFontSize),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await _auth.signOut();
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.clear();
                      Navigator.of(context).pop();
                      Map<String, dynamic> arg = {};
                      NavigationUtils.pushAndRemoveUntil(
                        context,
                        AppRoutes.routeLogin,
                        arguments: arg,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: sifBlue,
                    ),
                    child: Text(
                      'Sign Out',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 18, color: sifBlue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  final List<String> asestImages = <String>[
    '',
    'assets/images/BPL_Logo.jpeg',
    'assets/icons/c1.png',
    'assets/icons/c2.png',
    'assets/icons/c3.png',
    'assets/icons/c4.png',
    'assets/icons/c5.png'
  ];
  final List<String> titles = <String>[
    '',
    'BPL® Method',
    'Unidad 1',
    'Unidad 2',
    'Unidad 3',
    'Unidad 4',
    'Unidad 5'
  ];
  final List<String> subTitles = <String>[
    '',
    'The Neuroscience behind our teaching system!',
    'Presentémonos\n(Introducing Ourselves)',
    'Artículos Indefinidos\n(Indefinite Articles)',
    'Vocabulario La Familia\n(Family Vocabulary)',
    'Números, Horas, Fechas\n(Numbers, Times, Dates)',
    'Origen y Nacionalidad, Dinero\n(Origin and Nationality, Money)'
  ];

  void perfomMagic(index,) async {
    // setState(() {
    //   _isLoading = true;
    // });

    CustomerInfo customerInfo = await Purchases.getCustomerInfo();

    if (customerInfo.entitlements.all[entitlementID] != null &&
        customerInfo.entitlements.all[entitlementID]?.isActive == true) {

      if (currentUnit == 0) {
        currentUnit = 1;
      }
      if (index == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NeuroscienceUI()))
            .then(onGoBack);
      } else if (index == 2) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Unit1Activitys()))
            .then(onGoBack);
      } else if (index == 3) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Unit2Activitys()))
            .then(onGoBack);
      } else if (index == 4) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Unit3Activitys()))
            .then(onGoBack);
      } else if (index == 5) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Unit4Activitys()))
            .then(onGoBack);
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Unit5Activitys()))
            .then(onGoBack);
      }
      // setState(() {
      //   _isLoading = false;
      // });
    } else {
      Offerings? offerings;
      try {
        offerings = await Purchases.getOfferings();
      } on PlatformException catch (e) {
        await showDialog(
            context: context,
            builder: (BuildContext context) => ShowDialogToDismiss(
                title: "Error",
                content: e.message ?? "Unknown error",
                buttonText: 'OK'));
      }

      // setState(() {
      //   _isLoading = false;
      // });

      if (offerings == null || offerings.current == null) {
        // offerings are empty, show a message to your user
        await showDialog(
            context: context,
            builder: (BuildContext context) => ShowDialogToDismiss(
                title: "Error",
                content: "Unknown error",
                buttonText: 'OK'));
      } else {
        // current offering is available, show paywall
        await showModalBottomSheet(
          useRootNavigator: true,
          isDismissible: true,
          isScrollControlled: true,
          backgroundColor: kColorBackground,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
                  return Paywall(
                    offering: offerings!.current!,
                  );
                });
          },
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey.shade50,
          child: Image.asset(
            "assets/images/bpl_Logo.png",
            height: 65,
            alignment: Alignment.bottomCenter,
          )),
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 20);
          },
          // padding: const EdgeInsets.all(10),
          itemCount: asestImages.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
                child: Text(
              'Welcome to the SIF Language School App! Visit https://siflanguageschool.com/ to learn more.\n\nClick on anything with an unlocked symbol to get started. As you progress, more tiles will be unlocked. Happy learning!',
              textAlign: TextAlign.left,
              style:
                  TextStyle(fontSize: subtitleFontSize - 1, color: sifBlue),
                ),
              );
            } else {
              return ListTile(
                leading: CircleAvatar(
                    backgroundImage: AssetImage(asestImages[index])),
                title: Text(
                  titles[index],
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: titleFontSize, color: sifGreen),
                ),
                subtitle: Text(
                  subTitles[index],
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(fontSize: subtitleFontSize, color: sifGreen),
                ),
                visualDensity: VisualDensity(vertical: -4),
                trailing: (currentUnit >= index - 1) ? unlocked : locked,
                selected: (currentUnit >= index - 1) ? true : false,
                enabled: (currentUnit >= index - 1) ? true : false,
                onTap: () {
                  perfomMagic(index);
                },
              );
            }
          }),
      // body: ListView(
      //   children: <Widget>[
      //     Padding(
      //       padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
      //       child: Text(
      //         'Welcome to the SIF Language School App! Visit https://siflanguageschool.com/ to learn more.\n\nClick on anything with an unlocked symbol to get started. As you progress, more tiles will be unlocked. Happy learning!',
      //         textAlign: TextAlign.left,
      //         style: TextStyle(fontSize: subtitleFontSize-1, color: sifBlue),
      //       ),
      //     ),
      //     Container(
      //       height: boxHeight,
      //       child: ListTile(
      //         leading: const CircleAvatar(
      //             backgroundImage: AssetImage('assets/images/BPL_Logo.jpeg')),
      //         title: Text(
      //           'BPL® Method',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle: Text(
      //           'The Neuroscience behind our teaching system!',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         visualDensity: VisualDensity(vertical: -4),
      //         trailing: (currentUnit >= 0) ? unlocked : locked,
      //         selected: (currentUnit >= 0) ? true : false,
      //         enabled: (currentUnit >= 0) ? true : false,
      //         onTap: () {
      //           if (currentUnit == 0) {
      //             currentUnit = 1;
      //           }
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                   builder: (context) => NeuroscienceUI())).then(onGoBack);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child: ListTile(
      //         leading: const CircleAvatar(
      //             backgroundImage: AssetImage('assets/icons/c1.png')),
      //         title: Text(
      //           'Unidad 1',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle: Text(
      //           'Presentémonos\n(Introducing Ourselves)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         visualDensity: VisualDensity(vertical: -4),
      //         trailing: (currentUnit >= 1) ? unlocked : locked,
      //         selected: (currentUnit >= 1) ? true : false,
      //         enabled: (currentUnit >= 1) ? true : false,
      //         onTap: () {
      //           Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => const Unit1Activitys()))
      //               .then(onGoBack);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child: ListTile(
      //         leading: const CircleAvatar(
      //             backgroundImage: AssetImage('assets/icons/c2.png')),
      //         title: Text(
      //           'Unidad 2',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle: Text(
      //           'Artículos Indefinidos\n(Indefinite Articles)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: (currentUnit >= 2) ? unlocked : locked,
      //         selected: (currentUnit >= 2) ? true : false,
      //         enabled: (currentUnit >= 2) ? true : false,
      //         onTap: () {
      //           Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => const Unit2Activitys()))
      //               .then(onGoBack);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child: ListTile(
      //         leading: const CircleAvatar(
      //             backgroundImage: AssetImage('assets/icons/c3.png')),
      //         title: Text(
      //           'Unidad 3',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle: Text(
      //           'Vocabulario La Familia\n(Family Vocabulary)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: (currentUnit >= 3) ? unlocked : locked,
      //         selected: (currentUnit >= 3) ? true : false,
      //         enabled: (currentUnit >= 3) ? true : false,
      //         onTap: () {
      //           Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => const Unit3Activitys()))
      //               .then(onGoBack);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child: ListTile(
      //         leading: const CircleAvatar(
      //             backgroundImage: AssetImage('assets/icons/c4.png')),
      //         title: Text(
      //           'Unidad 4',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle: Text(
      //           'Números, Horas, Fechas\n(Numbers, Times, Dates)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: (currentUnit >= 4) ? unlocked : locked,
      //         selected: (currentUnit >= 4) ? true : false,
      //         enabled: (currentUnit >= 4) ? true : false,
      //         onTap: () {
      //           Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => const Unit4Activitys()))
      //               .then(onGoBack);
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: boxHeight,
      //       child: ListTile(
      //         leading: const CircleAvatar(
      //             backgroundImage: AssetImage('assets/icons/c5.png')),
      //         title: Text(
      //           'Unidad 5',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: titleFontSize, color: sifGreen),
      //         ),
      //         subtitle: Text(
      //           'Origen y Nacionalidad, Dinero\n(Origin and Nationality, Money)',
      //           textAlign: TextAlign.left,
      //           style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
      //         ),
      //         trailing: (currentUnit >= 5) ? unlocked : locked,
      //         selected: (currentUnit >= 5) ? true : false,
      //         enabled: (currentUnit >= 5) ? true : false,
      //         onTap: () {
      //           Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                       builder: (context) => const Unit5Activitys()))
      //               .then(onGoBack);
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

}
