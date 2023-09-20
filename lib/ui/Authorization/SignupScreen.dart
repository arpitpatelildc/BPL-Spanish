import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:sif_book/constant/Constant.dart';
import 'package:sif_book/startup/globals.dart';
import 'package:sif_book/utils/resources/color_utils.dart';
import 'package:sif_book/utils/resources/size_utils.dart';
import 'package:sif_book/utils/resources/style_utils.dart';
import 'package:sif_book/utils/validations/utils.dart';
import 'package:sif_book/widget/CustomAlertDilogue.dart';
import 'package:sif_book/widget/CustomTextfield.dart';
import 'package:sif_book/widget/progress_dialog.dart';
import '../../services/auth_service.dart';
import '../../widget/LoadingSplashScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

// Signupscreenshot
class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? txtFirstname;
  TextEditingController? txtSurname;
  TextEditingController? txtEmail;
  TextEditingController? txtPassword;

  String firstname = '';
  String surname = '';
  String email = '';
  String password = '';

  String errorEmail = '';
  String errorFname = '';
  String errorSname = '';
  String errorPassword = '';

  bool? _passwordVisible;

  double firstnameBorderWidth = 1.0;
  double surnameBordBorderWidth = 1.0;
  double emailBorderWidth = 1.0;
  double passwordBorderWidth = 1.0;

  Color firstnameBorderColor = AppColors.lightGrey;
  Color surnameBorderColor = AppColors.lightGrey;
  Color emailBorderColor = AppColors.lightGrey;
  Color passwordBorderColor = AppColors.lightGrey;

  Color firstnameInsideBorderColor = AppColors.lightGrey;
  Color surnameInsideBorderColor = AppColors.lightGrey;
  Color emailInsideBorderColor = AppColors.lightGrey;
  Color passwordInsideBorderColor = AppColors.lightGrey;

  bool isEnable = false;

  // Collection reference
  Map<String, dynamic> properties = {};

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    txtFirstname = TextEditingController();
    txtSurname = TextEditingController();
    txtEmail = TextEditingController();
    txtPassword = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    txtFirstname!.dispose();
    txtSurname!.dispose();
    txtEmail!.dispose();
    txtPassword!.dispose();
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
                AppStrings.signupWithEmail,
                style: TextStyle(color: AppColors.white),
              ),
            ),
            body: Form(
              key: _formKey,
              child: SafeArea(
                  child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                            horizontal: padding16, vertical: padding10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                titleFirstname(),
                                firstNameTextfield(),
                                errorFname != ""
                                    ? Text(
                                        errorFname,
                                        style: TextStyle(color: AppColors.red),
                                      )
                                    : Container(
                                        height: 0,
                                      ),
                                titleSurname(),
                                surnameTextfield(),
                                errorSname != ""
                                    ? Text(
                                        errorSname,
                                        style: TextStyle(color: AppColors.red),
                                      )
                                    : Container(
                                        height: 0,
                                      ),
                                titleEmail(),
                                emailTextfield(),
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
                                  height: getHeight(size10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: getHeight(size10)),
                    signupButton(),
                    SizedBox(height: getHeight(size10)),
                  ],
                ),
              )),
            )),
        if (isLoading) LoadingSplashScreen(),
      ],
    );
  }

  Widget titleFirstname() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding10),
      child: Text(AppStrings.firstName, style: smallBlackMediumTextStyle),
    );
  }

  Widget firstNameTextfield() {
    return Focus(
      canRequestFocus: false,
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          setState(() {
            firstnameBorderWidth = 3.0;
            firstnameBorderColor = sifBlue.withOpacity(.3);
            firstnameInsideBorderColor = AppColors.black;
          });
        } else {
          setState(() {
            firstnameBorderWidth = 1.0;
            firstnameBorderColor = AppColors.lightGrey;
            firstnameInsideBorderColor = AppColors.lightGrey;
          });
        }
      },
      child: CustomTextField(
        onchanged: (text) {
          setState(() {
            errorFname = "";
          });
        },
        isEnable: true,
        strkey: 'firstTextField',
        controller: txtFirstname,
        errorColor: AppColors.white,
        inputType: TextInputType.text,
        borderColor: firstnameBorderColor,
        insideBorderColor: firstnameInsideBorderColor,
        borderwidth: firstnameBorderWidth,
        borderradius: size12,
        hint: AppStrings.errorFirstname,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget titleSurname() {
    return Container(
      padding: EdgeInsets.only(top: padding20, bottom: padding10),
      child: Text(AppStrings.surName, style: smallBlackMediumTextStyle),
    );
  }

  Widget surnameTextfield() {
    return Focus(
      canRequestFocus: false,
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          setState(() {
            surnameBordBorderWidth = 3.0;
            surnameBorderColor = sifBlue.withOpacity(.3);
            surnameInsideBorderColor = AppColors.black;
          });
        } else {
          setState(() {
            surnameBordBorderWidth = 1.0;
            surnameBorderColor = AppColors.lightGrey;
            surnameInsideBorderColor = AppColors.lightGrey;
          });
        }
      },
      child: CustomTextField(
        onchanged: (text) {
          errorSname = '';
          if (mounted) setState(() {});
        },
        isEnable: true,
        strkey: 'surnameTextField',
        controller: txtSurname,
        errorColor: AppColors.white,
        inputType: TextInputType.text,
        borderColor: surnameBorderColor,
        insideBorderColor: surnameInsideBorderColor,
        borderwidth: surnameBordBorderWidth,
        borderradius: size12,
        hint: AppStrings.errorSurname,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget titleEmail() {
    return Container(
      padding: EdgeInsets.only(top: padding20, bottom: padding10),
      child: Text(AppStrings.email, style: smallBlackMediumTextStyle),
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
          setState(() {});
        },
        strkey: 'emailTextField',
        controller: txtEmail,
        isEnable: true,
        hint: AppStrings.errorEmail,
        errorColor: AppColors.white,
        inputType: TextInputType.emailAddress,
        borderColor: emailBorderColor,
        insideBorderColor: emailInsideBorderColor,
        borderwidth: emailBorderWidth,
        borderradius: size12,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget titlePassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(top: padding20, bottom: padding10),
          child: Text(AppStrings.password, style: smallBlackMediumTextStyle),
        ),
        Text(AppStrings.title8Characters, style: smallBlackRegularTextStyle)
      ],
    );
  }

  Widget passwordTextfield() {
    return Focus(
      canRequestFocus: false,
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          setState(() {
            passwordBorderWidth = 3.0;
            passwordBorderColor = sifBlue.withOpacity(.3);
            passwordInsideBorderColor = AppColors.black;
          });
        } else {
          setState(() {
            passwordBorderWidth = 1.0;
            passwordBorderColor = AppColors.lightGrey;
            passwordInsideBorderColor = AppColors.lightGrey;
          });
        }
      },
      child: CustomTextField(
        strkey: 'passwordTextField',
        isEnable: true,
        obscureText: _passwordVisible,
        controller: txtPassword,
        hint: AppStrings.errorPassword,
        errorColor: AppColors.red,
        inputType: TextInputType.text,
        borderColor: passwordBorderColor,
        borderwidth: passwordBorderWidth,
        insideBorderColor: passwordInsideBorderColor,
        textInputAction: TextInputAction.done,
        onchanged: (text) {
          errorPassword = '';
          if (text.length >= 6) {
            setState(() {
              isEnable = true;
            });
          } else {
            setState(() {
              isEnable = false;
            });
          }
        },
        suffixIcon:
            /* widget.fromEdit
            ? Container(
            child: GestureDetector(
                onTap: () async {

                  ProgressDialogUtils.showProgressDialog(context);
                  // var forgotPasswordResult= await AuthService().changePassword(context,getString(AppPrefereceKey.email));
                  var forgotPasswordResult= await ApiManager().userChangePassword(getString(AppPrefereceKey.email));
                  if(forgotPasswordResult==true) {
                    DialogUtils.displayToast(
                        'Please check your email to set a new password.');
                  }
                  else {
                    DialogUtils.displayToast(AppStrings.errorMSG);
                  }
                  ProgressDialogUtils.dismissProgressDialog(context);
                },
                child: Text(

                  AppStrings.editPassword,
                  style: smallAppColorSemiboldTextStyle,
                )))
            :*/
            SizedBox(
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
              setState(() {
                _passwordVisible = !_passwordVisible!;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget signupButton() {
    return txtFirstname!.text == "" ||
            txtSurname!.text == "" ||
            txtEmail!.text == "" ||
            txtPassword!.text == "" ||
            isEnable == false
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: padding16),
            alignment: Alignment.bottomCenter,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius12),
                  color: AppColors.loginButtonColor,
                ),
                height: getHeight(size50),
                alignment: Alignment.bottomCenter,
                child: Center(
                  key: Key('btnSignupTap'),
                  child: Text(
                    AppStrings.btnSignup,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: AppFontFamily.appFont,
                      fontWeight: FontWeight.w600,
                      fontSize: getFont(size14),
                      color: AppColors.grey,
                    ),
                  ),
                )))
        : Container(
            padding: EdgeInsets.symmetric(horizontal: padding16),
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                // form validation
                bool flag = true;
                if (_formKey.currentState!.validate()) {
                  if (txtFirstname!.text.toString().trim() == "") {
                    setState(() {
                      errorFname = AppStrings.errorFirstname;
                      flag = false;
                    });
                  }
                  if (txtSurname!.text.toString().trim() == "") {
                    setState(() {
                      errorSname = AppStrings.errorSurname;
                      flag = false;
                    });
                  }
                  if (Utils.isEmailValid(txtEmail!.text.toString().trim())) {
                    setState(() {
                      errorEmail = AppStrings.errorValidEmail;
                      flag = false;
                    });
                  }
                  if (Utils.validatePassword(
                          txtPassword!.text.toString().trim()) !=
                      null) {
                    setState(() {
                      errorPassword = AppStrings.errorValidPassword;
                      flag = false;
                    });
                  }
                  if (flag) {
                    signup();
                  }
                }
              },
              child: Container(
                  height: getHeight(size50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius12),
                    color: sifBlue,
                  ),
                  alignment: Alignment.bottomCenter,
                  child: Center(
                    child: Text(
                      AppStrings.btnSignup,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontFamily: AppFontFamily.appFont,
                        fontWeight: FontWeight.w600,
                        fontSize: getFont(size14),
                        color: AppColors.white,
                      ),
                    ),
                  )),
            ));
  }

  // signup Usign Firebase
  Future<void> signup() async {
    isLoading = true;
    setState(() {});
    var checkUserExist = await AuthService().doesUserExist(txtEmail!.text);
    if (!checkUserExist) {
      bool check = await AuthService().registerWithEmailAndPassword(
          context,
          txtEmail!.text,
          txtPassword!.text,
          txtFirstname!.text,
          txtSurname!.text);
      isLoading = check;
      setState(() {});
    } else {
      isLoading = false;
      setState(() {});
      log("User already Exist");
      // Show a Snackbar
      final snackBar = SnackBar(
        content: Text('User already Exist'),
        duration: Duration(seconds: 2), // Adjust the duration as needed
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
