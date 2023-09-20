import 'package:sif_book/constant/Constant.dart';

class Utils {
  // validate email
  static bool isEmailValid(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    var regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }

  // validate password atLeast 8 character
  static String? validatePassword(String value) {
    Pattern pattern = r'.{6,}$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value))
      return AppStrings.errorPassword;
    else
      return null;
  }

  // validate password atLeast 8 character
  static String? validateMobile(String value) {
    String pattern = r'^\d{9,17}$';  // r'(^(?:[+0]9)?[0-9]{10,11,12,13,14,15,16}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value) || value.length<9 && value.length>17) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  // find the value of between two rangeValue
  range(int a, [int? stop, int? step]) {
    int start;

    if (stop == null) {
      start = 0;
      stop = a;
    } else {
      start = a;
    }

    if (step == 0) throw Exception("Step cannot be 0");

    if (step == null)
      start < stop
          ? step = 1 // walk forwards
          : step = -1; // walk backwards

    // return [] if step is in wrong direction
    return start < stop == step > 0
        ? List<int>.generate(
            ((start - stop) / step).abs().ceil(), (int i) => start + (i * step!))
        : [];
  }
}
