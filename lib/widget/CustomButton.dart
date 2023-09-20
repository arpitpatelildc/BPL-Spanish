import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sif_book/utils/resources/size_utils.dart';
import 'package:sif_book/utils/resources/style_utils.dart';

import '../utils/resources/color_utils.dart';

// Custombutton for App
class CustomButton extends StatelessWidget {
  final String? title;
  final Function()? ontap;
  final Color? backgroundColor;
  final double? btnwidth;
  final double? btnHeight;
  final double? borderSize;
  final TextStyle? buttonTextStyle;
  var key;

   CustomButton(
      {
       this.title,
       this.ontap,
       this.backgroundColor,
       this.btnwidth,
       this.btnHeight = 50,
       this.buttonTextStyle,   this.borderSize,  this.key})
      : super();


  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnwidth,
      height: btnHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius12),
        border: Border.all(
            width: borderSize! > 0 ? getWidth(borderSize!) : 0,
            color: borderSize! > 0 ?AppColors.black : Colors.transparent),
        color: backgroundColor,
      ),
      child: TextButton(
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Center(
              child:
              buttonTextStyle ==null? AutoSizeText(
                title!,
                style:  mediumWhiteSemiboldTextstyle,
              ) : AutoSizeText(
                title!,
                style: buttonTextStyle,
              ),
            )
          ],
        ),
        onPressed: ontap,
      ),
    );
  }
}
