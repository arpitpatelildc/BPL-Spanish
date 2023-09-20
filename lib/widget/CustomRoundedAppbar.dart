import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sif_book/utils/resources/color_utils.dart';
import 'package:sif_book/utils/resources/size_utils.dart';
import 'package:sif_book/utils/resources/style_utils.dart';

// CustomRoundedAppbar for leading and trailing rounded button
class CustomRoundedAppbar extends StatefulWidget {
  Function()? ontap;
  String? title;
  String? icon;
  String? actionIcon;
  Function()? ontapActionIcon;

  CustomRoundedAppbar(
      {
       this.ontap,
       this.title,
       this.icon,
       this.actionIcon,
       this.ontapActionIcon})
      : super();

  @override
  _CustomRoundedAppbarState createState() => _CustomRoundedAppbarState();
}

class _CustomRoundedAppbarState extends State<CustomRoundedAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: padding15,bottom: padding45,
          left: padding16, right: padding16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: widget.ontap,
                child: widget.icon == null || widget.icon == ""
                    ? Text('')
                    : CircleAvatar(
                        backgroundColor: AppColors.white,
                        child: Container(
                            height: size40,
                            padding: EdgeInsets.all(padding13),
                            child: Image.asset(
                              widget.icon!,
                              height: getHeight(size15),
                              width: getWidth(size15),
                            )),
                      ),
              ),
              SizedBox(width: getWidth(size20)),
              Text(
                widget.title!,
                style: mediumBlackSemiboldTextstyle,
              ),
            ],
          ),
          GestureDetector(
            onTap: widget.ontapActionIcon,
            child: widget.actionIcon == null || widget.actionIcon == ""
                ? Text('')
                : CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: Container(
                        height: getHeight(size40),
                        padding: EdgeInsets.all(padding13),
                        child: Image.asset(
                          widget.actionIcon!,
                          height: getHeight(size15),
                          width: getWidth(size15),
                        )),
                  ),
          ),
        ],
      ),
    );
  }
}
