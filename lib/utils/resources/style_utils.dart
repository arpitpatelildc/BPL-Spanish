import 'package:flutter/material.dart';
import 'package:sif_book/constant/Constant.dart';
import 'package:sif_book/startup/globals.dart';
import 'color_utils.dart';
import 'size_utils.dart';

//Button textstyle for App
TextStyle buttonTextStyle = TextStyle(
  fontSize: size14,
  fontFamily: AppFontFamily.appFontSemiBold,
  color: AppColors.white,
);

TextStyle transparentTextStyle = TextStyle(
  fontSize: size14,
  fontFamily: AppFontFamily.appFontSemiBold,
  color: Colors.transparent,
);

// extrasmall Textstyles
TextStyle extrasmallBlackRegularTextStyle = TextStyle(
    fontSize: getFont(font12),
    fontFamily: AppFontFamily.appFontRegular,
    color: AppColors.black,
    letterSpacing: .7);
TextStyle extrasmallBlackFontBoldTextStyle = TextStyle(
    fontSize: getFont(font12),
    fontFamily: AppFontFamily.appFontBold,
    color: AppColors.black,
    letterSpacing: .7);
TextStyle extrasmallAppcolorRegularTextStyle = TextStyle(
    fontSize: getFont(font12),
    fontFamily: AppFontFamily.appFontRegular,
    color: sifBlue,
    height: 1.5);
TextStyle extrasmallgreyRegularTextStyle = TextStyle(
    fontSize: getFont(font12),
    fontFamily: AppFontFamily.appFontRegular,
    color: AppColors.grey,
    height: 1.5);
TextStyle extrasmallAppcolorSemiBoldTextStyle = TextStyle(
    fontSize: getFont(font11),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: sifBlue,
    letterSpacing: 1.0);
TextStyle extrasmallblackcolorSemiBoldTextStyle = TextStyle(
    fontSize: getFont(font13),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: AppColors.black,
    letterSpacing: 1.0);
TextStyle blackMediumTextstyle = TextStyle(
    fontSize: getFont(font11),
    fontFamily: AppFontFamily.appFontMedium,
    color: AppColors.black,
    letterSpacing: .5);
TextStyle appColorFont14Textstyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontMedium,
    color: sifBlue,
    letterSpacing: .5);
TextStyle blackFont14Textstyle = TextStyle(
    fontSize: getFont(font14), 
    fontFamily: AppFontFamily.appFontMedium,
    color: AppColors.black,
    letterSpacing: .5);
TextStyle blackFontBold14TextStyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontBold,
    color: AppColors.black,
    letterSpacing: .5);

TextStyle black1Font14Textstyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontMedium,
    color: AppColors.black1,
    letterSpacing: .5);

TextStyle extrasmallWhiteRegularTextStyle = TextStyle(
    fontSize: getFont(font13),
    fontFamily: AppFontFamily.appFontRegular,
    color: AppColors.white,
    letterSpacing: .7);

TextStyle smallWhiteFont13SemiBoldTextStyle = TextStyle(
    fontSize: getFont(font13),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: AppColors.white,
    letterSpacing: .7);

TextStyle extrasmallWhiteSmallTextStyle = TextStyle(
    fontSize: getFont(font10),
    fontFamily: AppFontFamily.appFontRegular,
    color: AppColors.white,
    letterSpacing: .7);

// small Textstyles
TextStyle smallBlackRegularTextStyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontRegular,
    color: AppColors.black,
    letterSpacing: .7);

TextStyle smallWhiteRegularTextStyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontRegular,
    color: AppColors.white,
    height: 1.5);
TextStyle smallWhiteSemiBoldTextStyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: AppColors.white,
    decoration: TextDecoration.none,
    height: 1.5);
TextStyle smallWhiteBoldTextStyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontBold,
    color: AppColors.white,
    height: 1.5);
TextStyle smallWhiteMediumTextStyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontMedium,
    color: AppColors.white,
    height: 1.5);
TextStyle smallGreyRegularTextStyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontRegular,
    color: AppColors.grey,
    letterSpacing: .7);
TextStyle smallAppColorRegularTextStyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontRegular,
    color: sifBlue,
    letterSpacing: .7);
TextStyle smallBlackMediumTextStyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontMedium,
    color: AppColors.black,
    letterSpacing: .7);
TextStyle smallGreyMediumTextStyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontMedium,
    color: AppColors.grey,
    letterSpacing: .7);
TextStyle smallBlackSemiboldTextStyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: AppColors.black,
    letterSpacing: .8);
TextStyle smallAppColorSemiboldTextStyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: sifBlue,
    letterSpacing: .7);
TextStyle smallAppColorBoldTextStyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFont,
    color: sifBlue,
    letterSpacing: .7);
TextStyle smallGreySemiboldTextStyle = TextStyle(
    fontSize: getFont(font14),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: AppColors.grey,
    letterSpacing: .7);

// medium Textstyles (16)
TextStyle mediumBlackSemiboldTextstyle = TextStyle(
    fontSize: getFont(font16),
    fontFamily: AppFontFamily.appFontSemiBold,
    letterSpacing: .8,
    color: AppColors.black);
TextStyle mediumBlackBoldTextstyle = TextStyle(
    fontSize: getFont(font16),
    fontFamily: AppFontFamily.appFontBold,
    letterSpacing: .8,
    color: AppColors.black);

TextStyle mediumGreyBoldTextstyle = TextStyle(
    fontSize: getFont(font16),
    fontFamily: AppFontFamily.appFontBold,
    letterSpacing: .8,
    color: AppColors.grey);

TextStyle mediumBlackMediumTextStyle = TextStyle(
    fontSize: getFont(font16),
    fontFamily: AppFontFamily.appFontMedium,
    color: AppColors.black,
    letterSpacing: .7);

TextStyle mediumBlack1MediumTextStyle = TextStyle(
    fontSize: getFont(font16),
    fontFamily: AppFontFamily.appFontMedium,
    color: AppColors.black1,
    letterSpacing: .7);

TextStyle font16Black1SemiBoldTextStyle = TextStyle(
    fontSize: getFont(font16),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: AppColors.black1,
    letterSpacing: .7);

TextStyle mediumWhiteSemiboldTextstyle = TextStyle(
    fontSize: getFont(font16),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: AppColors.white,
    letterSpacing: .7);
TextStyle appColorSemiBoldFont16 = TextStyle(
    fontSize: getFont(font16),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: sifBlue,
    letterSpacing: .7);
TextStyle appColorBoldFont16 = TextStyle(
    fontSize: getFont(font16),
    fontFamily: AppFontFamily.appFontBold,
    color: sifBlue,
    letterSpacing: .7);
TextStyle appColorFontRegular16 = TextStyle(
    fontSize: getFont(font16),
    fontFamily: AppFontFamily.appFontRegular,
    color: sifBlue,
    letterSpacing: .7);

// medium Textstyles(18)
TextStyle mediumBlackRegularTextStyle = TextStyle(
    fontSize: getFont(font18),
    fontFamily: AppFontFamily.appFontRegular,
    color: AppColors.black,);
TextStyle mediumBlackSemiBoldTextStyle = TextStyle(
    fontSize: getFont(font18),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: AppColors.black);
TextStyle mediumBlackBoldTextStyle = TextStyle(
    fontSize: getFont(font18),
    fontFamily: AppFontFamily.appFontBold,
    color: AppColors.black);

TextStyle mediumWhiteRegularTextStyle = TextStyle(
    fontSize: getFont(font18),
    fontFamily: AppFontFamily.appFontRegular,
    color: AppColors.white);

TextStyle mediumWhiteSemiBoldTextStyle = TextStyle(
    fontSize: getFont(font18),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: AppColors.white);

TextStyle mediumWhiteBoldTextStyle = TextStyle(
    fontSize: getFont(font18),
    fontFamily: AppFontFamily.appFontBold,
    color: AppColors.white);

TextStyle appColorSemiBoldFont18 = TextStyle(
    fontSize: getFont(font18),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: sifBlue);

// large Textstyles(20)
TextStyle largeBlackSemiboldTextStyle = TextStyle(
  fontSize: getFont(font20),
  fontFamily: AppFontFamily.appFontSemiBold,
  color: AppColors.black,
  letterSpacing: 1.0,
);
TextStyle largeWhiteSemiboldTextStyle = TextStyle(
    fontSize: getFont(font20),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: AppColors.white,
    letterSpacing: 1.2);

TextStyle largeBlackRegularBlackTextStyle = TextStyle(
    fontSize: getFont(font20),
    fontFamily: AppFontFamily.appFontRegular,
    color: AppColors.black,
    letterSpacing: 1.2);

TextStyle appColorFont20SemiBoldTextStyle = TextStyle(
    fontSize: getFont(font20),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: sifBlue,
    letterSpacing: 1.2);

TextStyle largeWhiteBoldTextStyle = TextStyle(
    fontSize: getFont(font20),
    fontFamily: AppFontFamily.appFontBold,
    letterSpacing: 1.9,
    color: AppColors.white);

TextStyle largeBlackBoldTextStyle = TextStyle(
    fontSize: getFont(font20),
    fontFamily: AppFontFamily.appFontBold,
    letterSpacing: 1.8,
    color: AppColors.black);

// large Textstyle(24)
TextStyle extraLargeBlackSemiboldTextStyle = TextStyle(
    fontSize: getFont(font24),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: AppColors.black);

TextStyle extraLargeAppColorSemiboldTextStyle = TextStyle(
    fontSize: getFont(font24),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: sifBlue);

TextStyle blackFont24TextStyle = TextStyle(
    fontSize: getFont(font24),
    letterSpacing: 1.8,
    fontFamily: AppFontFamily.appFont,
    color: AppColors.black);

//font 26
TextStyle font26BlackSemiboldTextStyle = TextStyle(
    fontSize: getFont(font26),
    fontFamily: AppFontFamily.appFontSemiBold,
    color: AppColors.black);
TextStyle blackFont26TextStyle = TextStyle(
    fontSize: getFont(font26),
    letterSpacing: 1.8,
    fontFamily: AppFontFamily.appFont,
    color: AppColors.black);

TextStyle appMainColorFont26TextStyle = TextStyle(
    fontSize: getFont(font26),
    letterSpacing: 1.8,
    fontFamily: AppFontFamily.appFontRegular,
    color: sifBlue);

TextStyle blackFont28TextStyle = TextStyle(
    fontSize: getFont(font28),
    letterSpacing: 1.8,
    fontFamily: AppFontFamily.appFontRegular,
    color: AppColors.black);

TextStyle extraLargeAppColorFont28TextStyle = TextStyle(
    fontSize: getFont(font28),
    letterSpacing: 1.8,
    fontFamily: AppFontFamily.appFontRegular,
    color: sifBlue);

TextStyle appColorFont28SemiBold = TextStyle(
    fontSize: getFont(font28),
    letterSpacing: 1.8,
    fontFamily: AppFontFamily.appFontSemiBold,
    color: sifBlue);

TextStyle appColorFont36SemiBold = TextStyle(
    fontSize: getFont(font36),
    letterSpacing: 1.8,
    fontFamily: AppFontFamily.appFontBold,
    color: sifBlue);

TextStyle  appColorFont55SemiBoldTextStyle = TextStyle(
    fontSize: getFont(font55),
    letterSpacing: 1.8,
    fontFamily: AppFontFamily.appFontSemiBold,
    color: sifBlue);