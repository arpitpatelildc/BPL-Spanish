import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sif_book/constant/Constant.dart';
import 'package:sif_book/ui/NewPayWall.dart';
import 'package:sif_book/ui/constant.dart';
import 'package:sif_book/ui/native_dialog.dart';
import 'package:sif_book/ui/singletons_data.dart';
import 'package:sif_book/ui/store_config.dart';
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
  bool isLoading = false;
  EntitlementInfo? entitlement;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    prefCheck();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> initPlatformState() async {
    // Enable debug logs before calling `configure`.
    await Purchases.setLogLevel(LogLevel.debug);
    var pref = await SharedPreferences.getInstance();

    var email = pref.getString("email");
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
      entitlement = customerInfo.entitlements.all[entitlementID];
      appData.entitlementIsActive = entitlement?.isActive ?? false;
      if (customerInfo.entitlements.all[entitlementID] != null &&
          customerInfo.entitlements.all[entitlementID]?.isActive == true) {
        isSubscribed = true;
      } else {
        isSubscribed = false;
      }
    });
  }

  String email = "sifBPL@gmail.com";
  String firstName = "";
  String surName = "";
  bool isSubscribed = false;

  prefCheck() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    email = pref.getString("email") ?? "sifBPL@gmail.com";
    firstName = pref.getString("firstName") ?? "";
    surName = pref.getString("lastName") ?? "";
    setState(() {});
  }

  expireDate(inputDateString) {
    DateTime dateTime = DateTime.parse(inputDateString);
    String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    return "Expired on: $formattedDate";
  }

  productIdentifier(String identifier){
    if(identifier.contains("monthly")){
      return "Subscription Type: Monthly";
    }else if(identifier.contains("half_yearly")){
      return "Subscription Type: Half Yearly";
    }
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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('$firstName $surName'),
              accountEmail: Text(email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/BPL_Logo.jpeg'),
              ),
            ),
            if (!isSubscribed)
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Subscribe'),
                onTap: () async {
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

                  if (offerings == null || offerings.current == null) {
                    // offerings are empty, show a message to your user
                    // await showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) => ShowDialogToDismiss(
                    //         title: "Error", content: "Unknown error", buttonText: 'OK'));
                  } else {
                    // current offering is available, show paywall
                    bool isSub = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PayWall(
                          offering: offerings!.current!,
                        ),
                      ),
                    );
                    if (isSub == true) {
                      isSubscribed = isSub;
                      setState(() {});
                    }
                  }
                },
              ),
            if (isSubscribed)
              ListTile(
                leading: Icon(Icons.check),
                title: Text('Subscribed'),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(entitlement?.expirationDate != null
                        ? expireDate(entitlement?.expirationDate)
                        : "",textAlign: TextAlign.start,),
                    Text(entitlement?.productIdentifier != null?productIdentifier(entitlement?.productIdentifier ?? "")  :"",textAlign: TextAlign.start,)
                  ],
                ),
                enabled: false,
              ),
            ListTile(
              onTap: () async {
                await _auth.signOut();
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.clear();
                Navigator.of(context).pop();
                Map<String, dynamic> arg = {};
                NavigationUtils.pushAndRemoveUntil(
                  context,
                  AppRoutes.routeLogin,
                  arguments: arg,
                );
              },
              leading: Icon(Icons.logout),
              title: Text('Sign out'),
            ),
          ],
        ),
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

  void perfomMagic(
    index,
  ) async {
    isLoading = true;
    setState(() {});
    CustomerInfo customerInfo = await Purchases.getCustomerInfo();

    if (customerInfo.entitlements.all[entitlementID] != null &&
        customerInfo.entitlements.all[entitlementID]?.isActive == true) {
      if (currentUnit == 0) {
        currentUnit = 1;
      }
      if (index == 1) {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => NeuroscienceUI()))
            .then(onGoBack);
      } else if (index == 2) {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Unit1Activitys()))
            .then(onGoBack);
      } else if (index == 3) {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Unit2Activitys()))
            .then(onGoBack);
      } else if (index == 4) {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Unit3Activitys()))
            .then(onGoBack);
      } else if (index == 5) {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Unit4Activitys()))
            .then(onGoBack);
      } else {
        Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Unit5Activitys()))
            .then(onGoBack);
      }
      isLoading = false;
      setState(() {});
    } else {
      Offerings? offerings;
      try {
        offerings = await Purchases.getOfferings();
      } on PlatformException catch (e) {
        isLoading = false;
        setState(() {});
        await showDialog(
            context: context,
            builder: (BuildContext context) => ShowDialogToDismiss(
                title: "Error",
                content: e.message ?? "Unknown error",
                buttonText: 'OK'));
      }

      if (offerings == null || offerings.current == null) {
        // offerings are empty, show a message to your user
        // await showDialog(
        //     context: context,
        //     builder: (BuildContext context) => ShowDialogToDismiss(
        //         title: "Error", content: "Unknown error", buttonText: 'OK'));
      } else {
        // current offering is available, show paywall
        bool? isSub = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PayWall(
              offering: offerings!.current!,
            ),
          ),
        );
        if (isSub == true) {
          isSubscribed = true;
        } else {
          isSubscribed = true;
        }
        isLoading = false;
        setState(() {});
      }
    }
  }

  Widget ListWidget() {
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
                  style: TextStyle(fontSize: subtitleFontSize, color: sifGreen),
                ),
                visualDensity: VisualDensity(vertical: -4),
                trailing: isSubscribed
                    ? (currentUnit >= index - 1)
                        ? unlocked
                        : locked
                    : locked,
                selected: (currentUnit >= index - 1) ? true : false,
                enabled: (currentUnit >= index - 1) ? true : false,
                onTap: () {
                  perfomMagic(index);
                },
              );
            }
          }),
    );
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }
}
