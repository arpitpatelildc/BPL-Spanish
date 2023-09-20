import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sif_book/utils/resources/size_utils.dart';
import 'package:sif_book/utils/resources/style_utils.dart';

// Appbar for app
class CustomAppbar1 extends StatefulWidget {
  Function()? ontap;
  String? title;
  String? icon;
  String? actionIcon;
  Function()? ontapActionIcon;
  String? backKey;

  CustomAppbar1(
      {
       this.ontap,
       this.title,
       this.icon,
       this.actionIcon,
       this.ontapActionIcon,
       this.backKey})
      : super();

  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: size48,
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      key: Key(widget.backKey!),
                      onPressed: widget.ontap,
                      child: widget.icon == null || widget.icon == ""
                          ? Text('')
                          : Container(
                              padding: EdgeInsets.only(left: padding8),
                              child: Image.asset(widget.icon!,
                                  height: getHeight(size15))),
                    ),
                  ),
                  Container(
                      child: Text(
                    widget.title!,
                    style: mediumBlackSemiboldTextstyle,
                  )),
                ],
              ),
              TextButton(
                style: ElevatedButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: widget.ontapActionIcon,
                child: widget.actionIcon == null || widget.actionIcon == ""
                    ? Text('')
                    : Container(
                        padding: EdgeInsets.only(
                            top: padding10, bottom: padding15, left: padding8),
                        child: Image.asset(widget.actionIcon!,
                            height: getHeight(size12))),
              ),
            ],
          ),
          SizedBox(
            height: getHeight(size3),
          )
        ],
      ),
    );
  }
}
