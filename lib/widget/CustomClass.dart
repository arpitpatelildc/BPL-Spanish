import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sif_book/constant/Constant.dart';
import 'package:sif_book/utils/resources/preference_utils.dart';

class CustomClass {
/*  static setOrientations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }*/

  static setportraitOrientations() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static getPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }
/*  // initialize Intercom
  static initializedShake() async {
    Shake.setInvokeShakeOnScreenshot(true);
    Shake.setInvokeShakeOnShakeDeviceEvent(true);
    Shake.setShowFloatingReportButton(false);
    Shake.setShowIntroMessage(true);
    Shake.setSensitiveDataRedactionEnabled(true);
    Shake.isAutoVideoRecording();
    Shake.isConsoleLogsEnabled();
    Shake.getShowIntroMessage();
    Shake.isInvokeShakeOnShakeDeviceEvent();
    Shake.isInvokeShakeOnScreenshot();
    Shake.isEnableActivityHistory();
    Shake.isScreenshotIncluded();
    Shake.start(ProdApp.shakebugsclientid, ProdApp.shakebugsclientsecret);
  }
  // initialize Intercom
  static deinitializedShake() async {
    Shake.setInvokeShakeOnScreenshot(false);
    Shake.setInvokeShakeOnShakeDeviceEvent(false);
    Shake.setShowFloatingReportButton(false);
    Shake.setAutoVideoRecording(false);
    Shake.setShowIntroMessage(false);
    Shake.setEmailField("");
    Shake.setSensitiveDataRedactionEnabled(false);
    Shake.setConsoleLogsEnabled(false);
  }*/
/*
  static intializedFacebookSDK() async {
    try{
      String _deepLinkUrl = 'Unknown';
      FlutterFacebookSdk facebookDeepLinks;
      String deepLinkUrl;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        facebookDeepLinks = FlutterFacebookSdk();
        facebookDeepLinks.onDeepLinkReceived.listen((event) {
          _deepLinkUrl = event;
        });
        deepLinkUrl = await facebookDeepLinks.getDeepLinkUrl;
        _deepLinkUrl = deepLinkUrl;
        await facebookDeepLinks.logActivateApp().then((value) {
        }).onError((error, stackTrace) {
        });
        await facebookDeepLinks.setAdvertiserTracking(isEnabled: true);
      } on PlatformException {}
    }catch(E)
    {
    }
  }*/
}
