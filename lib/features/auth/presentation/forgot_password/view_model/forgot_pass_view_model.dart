import 'package:flutter/material.dart';

class ForgotPassViewModel extends ChangeNotifier {
  bool isObscure = false;
  bool isObscure2 = false;

  toggleObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  toggleObscure2() {
    isObscure2 = !isObscure2;
    notifyListeners();
  }
}
