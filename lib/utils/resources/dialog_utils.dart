import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sif_book/utils/resources/color_utils.dart';
import 'package:sif_book/utils/resources/size_utils.dart';
import 'package:sif_book/widget/AlertDialogue.dart';
import 'package:sif_book/widget/CustomOkAlertDialogue.dart';

// alert dialogue for app
class DialogUtils {
  static Future<void> alertOKdialogue(
      { BuildContext? context,
         String? messageString,
         Function()? ontap,
         Function()? ontapCancle,
         String? titleCancle,
         String? titleYes,
         double? dialogHeight}) {
    return showDialog(
      context: context!,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: ShowAlertDialog(
            message: messageString!,
            ontapYes: ontap!,
            ontapCancle: ontapCancle!,
            titleCancle: titleCancle!,
            titleYes: titleYes!,
            dialogHeight: dialogHeight!),
      ),
    );
  }

//toast for app
 /* static Future<bool> displayToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.black,
        textColor: AppColors.white,
        fontSize: getFont(font14));
  }*/

  static Future<bool?> displayToast(String message) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.black,
        textColor: AppColors.white,
        fontSize: font14);
  }

  static Future<bool?> clearToast() {
    return Fluttertoast.cancel();
  }

  static Future<void> showOkDialogue({
     BuildContext? context,
     String? messageString,
     String? title,
     Function()? ontap,
  }) {
    return showDialog(
      context: context!,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: ShowCustomOkAlertDialogue(
            content: messageString!, ontap: ontap!, title: title!),
      ),
    );
  }
}
