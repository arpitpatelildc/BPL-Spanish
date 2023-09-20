import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sif_book/constant/Constant.dart';
import 'package:sif_book/utils/resources/color_utils.dart';
import 'package:sif_book/utils/resources/size_utils.dart';

// Customtextfield use for App
class CustomTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final Color? baseColor;
  final Color? borderColor;
  final Color? errorColor;
  final TextInputType? inputType;
  final bool? obscureText;
  final double? borderradius;
  final Widget? suffixIcon;
  final double? borderwidth;
  final Color? insideBorderColor;
  final TextInputAction? textInputAction;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final Widget? suffix;
  final bool? isEnable;
  final String? strkey;
  final Function? onchanged;

  CustomTextField(
      {this.hint,
        this.controller,
        this.baseColor,
        this.borderColor,
        this.errorColor,
        this.suffix,
        this.inputType,
        this.obscureText = false,
        this.borderradius,
        this.suffixIcon,
        this.borderwidth = 0.0,
        this.insideBorderColor = AppColors.lightGrey,
        this.textInputAction,
        this.suffixText,
        this.suffixStyle,
        this.isEnable,
        this.strkey,
        this.onchanged});

  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Color? currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.borderColor!;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfigs().init(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius15),
          border: Border.all(
              width: getWidth(widget.borderwidth!), color: widget.borderColor!)),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padding10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radius12),
            border: Border.all(
                width: getWidth(.5), color: widget.insideBorderColor!)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: getWidth(size5),
            ),
            Expanded(
              child: TextFormField(
                key: Key(widget.strkey!),
                obscuringCharacter: "*",
                enabled: widget.isEnable,
                autofocus: false,
                obscureText: widget.obscureText!,
                keyboardType: widget.inputType,
                controller: widget.controller,
                style: TextStyle(
                  color: AppColors.black,
                  fontFamily: AppFontFamily.appFontRegular,
                  fontSize: getFont(font14),
                  // fontWeight: FontWeight.normal,
                ),
                onChanged: (text) {
                  if (widget.onchanged != null) {
                    widget.onchanged!(text);
                  }
                  if(mounted)
                    setState(() {
                      if (text.length == 0) {
                        currentColor = widget.errorColor;
                      } else {
                        currentColor = widget.baseColor;
                      }
                    });
                },
                textInputAction: widget.textInputAction,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: AppColors.grey,
                    fontFamily: AppFontFamily.appFontRegular,
                    fontSize: getFont(font14),

                    // fontWeight: FontWeight.w300,
                  ),
                  border: InputBorder.none,
                  hintText: widget.hint,
                ),
              ),
            ),
            Container(child: widget.suffixIcon),
          ],
        ),
      ),
    );
  }
}
