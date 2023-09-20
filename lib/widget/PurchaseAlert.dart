
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

import '../utils/resources/image_utils.dart';
import '../utils/resources/style_utils.dart';

class PurchaseAlert extends StatelessWidget {
  const PurchaseAlert({
    this.message,
    this.actions = const [],
    Key? key,
  }) : super(key: key);

  final String? message;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title:   RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: mediumBlackSemiboldTextstyle,
          children: [
            WidgetSpan(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                // child: SvgPicture.asset(
                //   AppImages.appColorLogo,
                //   fit: BoxFit.fill,
                //   height: 40,
                //   width: 40,
                // ),
              ),
            ),
          ],
        ),
      ),
      titleTextStyle: smallBlackMediumTextStyle,
      content: message == null
          ? null
          : Text(
        message!,
        textAlign: TextAlign.center,
      ),
      contentTextStyle: smallBlackMediumTextStyle,
      actionsAlignment: MainAxisAlignment.center,
      actionsOverflowButtonSpacing: 8.0,
      actions: actions,
    );
  }
}