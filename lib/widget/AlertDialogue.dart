import 'package:flutter/material.dart';
import 'package:sif_book/utils/resources/color_utils.dart';
import 'package:sif_book/utils/resources/size_utils.dart';
import 'package:sif_book/utils/resources/style_utils.dart';

// simple alert dialogue for app
class ShowAlertDialog extends StatelessWidget {
  final String? message;
  final Function()? ontapYes;
  final Function()? ontapCancle;
  final String? titleYes;
  final String? titleCancle;
  final double? dialogHeight;

  const ShowAlertDialog(
      {
      this.message,
      this.ontapYes,
      this.ontapCancle,
      this.titleCancle,
      this.titleYes,
      this.dialogHeight})
      : super();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationCurve: Curves.fastOutSlowIn,
      insetAnimationDuration: const Duration(milliseconds: 500),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius20),
      ),
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: getHeight(dialogHeight!),
          padding: EdgeInsets.all(padding30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius10),
            color: Colors.white,
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  message!,
                  style: smallBlackSemiboldTextStyle,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Container(
                      height: getHeight(size40),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius10),
                          color: AppColors.appMainColor),
                      child: Text(titleYes!, style: buttonTextStyle),
                    ),
                    onTap: ontapYes,
                  ),
                  titleCancle.toString().trim() != ""
                      ? GestureDetector(
                          child: Container(
                            height: getHeight(size40),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius10)),
                            child: Text(titleCancle!,
                                style: smallAppColorRegularTextStyle),
                          ),
                          onTap: ontapCancle,
                        )
                      : Container(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
