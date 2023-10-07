import 'dart:developer';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:sif_book/constant/Constant.dart';
import 'package:sif_book/startup/globals.dart';
import 'package:sif_book/utils/resources/color_utils.dart';
import 'package:sif_book/utils/resources/size_utils.dart';
import 'package:sif_book/utils/resources/style_utils.dart';
import 'package:sif_book/utils/route/navigation.dart';
import 'package:sif_book/utils/validations/utils.dart';
import 'package:sif_book/widget/CustomTextfield.dart';
import 'package:sif_book/widget/LoadingSplashScreen.dart';
import '../../../widget/ScreenListener.dart';
import '../../services/auth_service.dart';

class LoginScreen extends ScreenListener {
  LoginScreen() : super();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ScreenListenerState<ScreenListener> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  String errorEmail = '';
  String errorPassword = '';

  bool? _passwordVisible;

  double emailBorderWidth = 1.0;
  double passwordBorderWidth = 1.0;

  Color emailBorderColor = AppColors.lightGrey;
  Color passwordBorderColor = AppColors.lightGrey;

  Color emailInsideBorderColor = AppColors.lightGrey;
  Color passwordInsideBorderColor = AppColors.lightGrey;
  bool isEnable = false;

  Map<String, dynamic> properties = {};

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    txtEmail = TextEditingController();
    txtPassword = TextEditingController();
    _passwordVisible = true;
    properties = {
      'platform': Platform.operatingSystem,
    };
  }

  @override
  void dispose() {
    txtEmail.dispose();
    txtPassword.dispose();
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
                "Welcome",
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
                                ),
                          titlePassword(),
                          passwordTextfield(),
                          errorPassword != ""
                              ? Text(
                                  errorPassword,
                                  style: TextStyle(color: AppColors.red),
                                )
                              : Container(
                                  height: 0,
                                ),
                          SizedBox(
                            height: padding10,
                          ),
                          btnForgotPassword()
                        ],
                      ),
                    ),
                    loginButton(),
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
        if (mounted) {
          setState(() {
            if (hasFocus) {
              emailBorderWidth = 3.0;
              emailBorderColor = sifBlue.withOpacity(.3);
              emailInsideBorderColor = AppColors.black;
            } else {
              emailBorderWidth = 1.0;
              emailBorderColor = AppColors.lightGrey;
              emailInsideBorderColor = AppColors.lightGrey;
            }
          });
        }
      },
      child: CustomTextField(
        onchanged: (text) {
          errorEmail = '';
          if (mounted) setState(() {});
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

  Widget passwordTextfield() {
    return Focus(
      canRequestFocus: false,
      onFocusChange: (hasFocus) {
        if (mounted) {
          setState(() {
            if (hasFocus) {
              passwordBorderWidth = 3.0;
              passwordBorderColor = sifBlue.withOpacity(.3);
              passwordInsideBorderColor = AppColors.black;
            } else {
              passwordBorderWidth = 1.0;
              passwordBorderColor = AppColors.lightGrey;
              passwordInsideBorderColor = AppColors.lightGrey;
            }
          });
        }
      },
      child: CustomTextField(
        strkey: 'passwordTextField',
        obscureText: _passwordVisible,
        controller: txtPassword,
        errorColor: AppColors.red,
        inputType: TextInputType.text,
        borderColor: passwordBorderColor,
        borderwidth: passwordBorderWidth,
        hint: AppStrings.errorPassword,
        insideBorderColor: passwordInsideBorderColor,
        textInputAction: TextInputAction.done,
        onchanged: (text) {
          if (mounted) {
            setState(() {
              if (text.length >= 6) {
                isEnable = true;
              } else {
                isEnable = false;
              }
            });
          }
        },
        suffixIcon: SizedBox(
          width: getWidth(size35),
          child: IconButton(
            splashRadius: radius1,
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible!
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: AppColors.black,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              if (mounted) {
                setState(() {
                  _passwordVisible = !_passwordVisible!;
                });
              }
            },
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            TextButton(
                onPressed: () {
                  Map<String, dynamic> args = {};
                  NavigationUtils.push(context, AppRoutes.routeSignUp,
                      arguments: args);
                },
                child: Text("Signup"))
          ],
        ),
        txtEmail.text == "" || txtPassword.text == "" || isEnable == false
            ? Container(
                height: getHeight(size50),
                padding: EdgeInsets.symmetric(horizontal: padding16),
                child: Container(
                  key: Key('btnLoginTap'),
                  alignment: Alignment.bottomCenter,
                  child: Center(
                    child: Text(
                      AppStrings.btnLogin,
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
                key: Key('btnLoginTap'),
                onTap: () {
                  // form validation
                  if (_formKey.currentState!.validate()) {
                    if (mounted) {
                      setState(() {
                        if (Utils.isEmailValid(txtEmail.text)) {
                          errorEmail = AppStrings.errorValidEmail;
                        } else if (Utils.validatePassword(txtPassword.text) !=
                            null) {
                          errorPassword = AppStrings.errorValidPassword;
                        } else {
                          errorEmail = "";
                          errorPassword = "";
                          FocusScope.of(context).unfocus();
                          // ProgressDialogUtils.showProgressDialog(context);
                          login();
                        }
                      });
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
                            AppStrings.btnLogin,
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontFamily: AppFontFamily.appFont,
                              fontWeight: FontWeight.w600,
                              fontSize: getFont(size14),
                              color: AppColors.white,
                            ),
                          ),
                        ))),
              ),
      ],
    );
  }

  Widget btnForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            final Map<String, dynamic> data = {};
            NavigationUtils.push(context, AppRoutes.routeForgotPassword,
                arguments: data);
          },
          child: Text(
            "${AppStrings.forgotPassword}?",
            textAlign: TextAlign.center,
            style: smallAppColorSemiboldTextStyle,
          ),
        ),
      ],
    );
  }

  // Login button action using firebase
  Future<void> login() async {
    isLoading = true;
    setState(() {});
    var checkUserExist = await AuthService().doesUserExist(txtEmail.text);
    debugPrint('${txtEmail.text},${txtPassword.text}');
    if (checkUserExist) {
      bool check = await AuthService()
          .signInWithEmailAndPassword(context, txtEmail.text, txtPassword.text);
      isLoading = check;
      setState(() {});
    } else {
      isLoading = false;
      setState(() {});
      log("User Not Exist");
      // Show a Snackbar
      final snackBar = SnackBar(
        content: Text('User Not Exist'),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
