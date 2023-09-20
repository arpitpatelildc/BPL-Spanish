import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sif_book/constant/Constant.dart';
import 'package:sif_book/utils/resources/dialog_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class ScreenListener extends StatefulWidget {
  ScreenListener() : super();
}

abstract class ScreenListenerState<T extends ScreenListener> extends State<T>
    with WidgetsBindingObserver {

  SharedPreferences? prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

}
