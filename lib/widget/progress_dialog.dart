import 'package:flutter/material.dart';
import 'package:sif_book/utils/resources/image_utils.dart';
import 'package:sif_book/utils/resources/size_utils.dart';
import 'package:sif_book/constant/Constant.dart';

import '../main.dart';

// Progressdialogue use for loadingindicator when in any processing
class ProgressDialogUtils {
  static final ProgressDialogUtils _instance = ProgressDialogUtils.internal();
  static bool _isLoading = false;

  ProgressDialogUtils.internal();

  factory ProgressDialogUtils() => _instance;

  static BuildContext? context;

  static void dismissProgressDialog(BuildContext context) {
    if (_isLoading) {
      Navigator.of(context).pop();
      _isLoading = false;
    }
  }

  static void showProgressDialog(BuildContext context) async {
    context = context;
    _isLoading = true;
    await showDialog(
        context:  context,
        barrierDismissible: false,
        barrierColor: Colors.white38,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              children: <Widget>[LoadingIndicator()],
            ),
          );
        });
  }
}

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(AppImages.icLoading, height: getHeight(size50)));
  }
}
