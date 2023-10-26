import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:sif_book/constant/Constant.dart';
import 'package:sif_book/startup/globals.dart';
import 'package:sif_book/utils/resources/color_utils.dart';
import 'package:sif_book/utils/resources/size_utils.dart';
import 'package:sif_book/utils/resources/style_utils.dart';
import 'package:sif_book/utils/validations/utils.dart';
import 'package:sif_book/widget/CustomTextfield.dart';
import 'package:sif_book/widget/LoadingSplashScreen.dart';
import '../../../widget/progress_dialog.dart';
import '../../services/auth_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen() : super();

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController txtEmail = TextEditingController();

  String email = '';
  String errorEmail = '';

  double emailBorderWidth = 1.0;

  Color emailBorderColor = AppColors.lightGrey;

  Color emailInsideBorderColor = AppColors.lightGrey;
  bool isEnable = false;
  bool isLoading = false;

  Map<String, dynamic> properties = {};

  @override
  void initState() {
    super.initState();
    txtEmail = TextEditingController();
    properties = {
      'platform': Platform.operatingSystem,
    };
  }

  @override
  void dispose() {
    txtEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfigs().init(context);

    return Stack(
      children: [
        Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                AppStrings.forgotPassword,
                style: TextStyle(color: AppColors.white),
              ),
            ),
            body: SafeArea(
                child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(
                            horizontal: padding16, vertical: padding10),
                        children: [
                          titleEmail(),
                          emailTextfield(),
                          SizedBox(
                            height: getHeight(size10),
                          ),
                          errorEmail != ""
                              ? Text(
                                  errorEmail,
                                  style: TextStyle(color: AppColors.red),
                                )
                              : Container(
                                  height: 0,
                                )
                        ],
                      ),
                    ),
                    ForgotPasswordButton(),
                    SizedBox(height: getHeight(size10)),
                  ],
                ),
              ),
            ))),
        if (isLoading) LoadingSplashScreen(),
      ],
    );
  }

  Widget titleEmail() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding10),
      child: Text(AppStrings.email, style: smallBlackMediumTextStyle),
    );
  }

  Widget titlePassword() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding10),
      child: Text(AppStrings.password, style: smallBlackMediumTextStyle),
    );
  }

  Widget emailTextfield() {
    return Focus(
      canRequestFocus: false,
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          setState(() {
            emailBorderWidth = 3.0;
            emailBorderColor = sifBlue.withOpacity(.3);
            emailInsideBorderColor = AppColors.black;
          });
        } else {
          setState(() {
            emailBorderWidth = 1.0;
            emailBorderColor = AppColors.lightGrey;
            emailInsideBorderColor = AppColors.lightGrey;
          });
        }
      },
      child: CustomTextField(
        onchanged: (text) {
          errorEmail = '';
          bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(text);
          if (emailValid) isEnable = true;
          setState(() {});
        },
        strkey: 'emailTextField',
        controller: txtEmail,
        errorColor: AppColors.white,
        inputType: TextInputType.emailAddress,
        borderColor: emailBorderColor,
        insideBorderColor: emailInsideBorderColor,
        borderwidth: emailBorderWidth,
        borderradius: size12,
        textInputAction: TextInputAction.next,
        hint: AppStrings.errorEmail,
      ),
    );
  }

  Widget ForgotPasswordButton() {
    return txtEmail.text == "" || isEnable == false
        ? Container(
            height: getHeight(size50),
            padding: EdgeInsets.symmetric(horizontal: padding16),
            child: Container(
              key: Key('btnForgotPasswordTap'),
              alignment: Alignment.bottomCenter,
              child: Center(
                child: Text(
                  AppStrings.btnForgotPwd,
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: AppFontFamily.appFont,
                      fontWeight: FontWeight.w600,
                      fontSize: getFont(size14),
                      color: AppColors.grey),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius12),
                color: AppColors.loginButtonColor,
              ),
            ),
          )
        : GestureDetector(
            key: Key('btnForgotPasswordTap'),
            onTap: () {
              // form validation
              if (_formKey.currentState!.validate()) {
                if (Utils.isEmailValid(txtEmail.text)) {
                  setState(() {
                    errorEmail = AppStrings.errorValidEmail;
                  });
                } else {
                  errorEmail = "";
                  forgotPassword();
                }
              }
            },
            child: Container(
              height: getHeight(size50),
              padding: EdgeInsets.symmetric(horizontal: padding16),
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius12),
                  color: sifBlue,
                ),
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: Text(
                    AppStrings.btnForgotPwd,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: AppFontFamily.appFont,
                      fontWeight: FontWeight.w600,
                      fontSize: getFont(size14),
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  // ForgotPassword button action using firebase
  Future<void> forgotPassword() async {
    isLoading = true;
    setState(() {});
    var checkUserExist = await AuthService().doesUserExist(txtEmail.text);
    if (checkUserExist) {
      bool check = await AuthService().changePassword(context, txtEmail.text);
      isLoading = check;
      setState(() {});
    } else {
      isLoading = false;
      setState(() {});
      log("User not Exist");
      // Show a Snackbar
      final snackBar = SnackBar(
        content: Text('User Not Exist'),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    // ProgressDialogUtils.showProgressDialog(context);
    // if (await ApiService().checkInternet()) {
    //   try {
    //     final result = await AuthService().checkUserEmail(txtEmail.text);
    //     if (result == true) {
    //       // var forgotPasswordResult= await AuthService().changePassword(context,txtEmail.text);
    //       var forgotPasswordResult =
    //           await ApiManager().userChangePassword(txtEmail.text);
    //       debugPrint('forgotPasswordResult ===== $forgotPasswordResult');
    //       if (forgotPasswordResult == true) {
    //         DialogUtils.displayToast(
    //             'Please check your email to set a new password.');
    //         // ProgressDialogUtils.dismissProgressDialog(context);
    //         Future<void>.delayed(const Duration(seconds: 1), () {
    //           final Map<String, dynamic> data = new Map<String, dynamic>();
    //           NavigationUtils.push(context, AppRoutes.routeOnboarding,
    //               arguments: data);
    //         });
    //       }
    //       else {
    //         DialogUtils.displayToast(AppStrings.errorMSG);
    //         ProgressDialogUtils.dismissProgressDialog(context);
    //       }
    //     } else {
    //       DialogUtils.displayToast("Email dose not exist.");
    //       ProgressDialogUtils.dismissProgressDialog(context);
    //     }
    //   } catch (E) {
    //     //  debugPrint("ForgotPassword Error $E");
    //   }
    // } else {
    //   DialogUtils.displayToast(AppStrings.erroInternetconnection);
    // }
  }
}
