import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sif_book/constant/Constant.dart';
import 'package:sif_book/utils/resources/dialog_utils.dart';
import 'package:sif_book/utils/route/navigation.dart';
import 'package:sif_book/widget/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> doesUserExist(String email) async {
    List<String> user =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    return user.isEmpty ? false : true;
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    // if (await ApiService().checkInternet()) {
    try {
      var pref = await SharedPreferences.getInstance();
      UserCredential userRef = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      pref.setString("userId", userRef.user!.uid);
      final Map<String, dynamic> data = {};
      NavigationUtils.pushAndRemoveUntil(context, AppRoutes.routeUnit,
          arguments: data);
    } on FirebaseAuthException catch (e) {
      ProgressDialogUtils.dismissProgressDialog(context);
      if (e.code == 'user-not-found') {
        DialogUtils.displayToast(AppStrings.errorUserNotFound);
      } else if (e.code == 'wrong-password') {
        DialogUtils.displayToast(AppStrings.errorWrongPassword);
      } else {
        debugPrint('FirebaseAuthException ==== $e');
        DialogUtils.displayToast(AppStrings.errorMSG);
      }
      return false;
    }
    // }
    // else {
    //   ProgressDialogUtils.dismissProgressDialog(context);
    //   DialogUtils.displayToast(AppStrings.erroInternetconnection);
    // }
  }

  // register with email and password
  Future registerWithEmailAndPassword(BuildContext context, String email,
      String password, String firstName, String surName) async {
    // if (await ApiService().checkInternet()) {
    //   ProgressDialogUtils.showProgressDialog(context);
    try {
      var pref = await SharedPreferences.getInstance();
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // Store additional user data in Firebase Realtime Database
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      pref.setString("userId", userCredential.user!.uid);
      try {
        await users.doc(userCredential.user!.uid).set({
          'email': email,
          'firstName': firstName,
          'surName': surName,
        });
      } catch (e) {
        log(e.toString());
      }
      pref.setString("userId", userCredential.user!.uid);
      final Map<String, dynamic> data = {};
      NavigationUtils.pushAndRemoveUntil(context, AppRoutes.routeUnit,
          arguments: data);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ProgressDialogUtils.dismissProgressDialog(context);
        DialogUtils.displayToast(AppStrings.errorWeakPassword);
      } else if (e.code == 'email-already-in-use') {
        ProgressDialogUtils.dismissProgressDialog(context);
        DialogUtils.displayToast(AppStrings.errorEmailExist);
      } else {
        ProgressDialogUtils.dismissProgressDialog(context);
        DialogUtils.displayToast(e.toString());
      }
      return false;
    }
    // else {
    //   DialogUtils.displayToast(AppStrings.erroInternetconnection);
    // }
  }

  //Change password
  Future changePassword(BuildContext context, email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset email sent. Check your inbox.'),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error sending password reset email: $e'),
        ),
      );
    }
    return false;
  }
}
