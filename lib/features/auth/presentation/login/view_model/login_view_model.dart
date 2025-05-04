import 'package:feature_based_mvvm_architecture/app/constants/app_constants.dart';
import 'package:feature_based_mvvm_architecture/utils/di.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool isLogin = appData.read(kKeyIsLoggedIn) == true ? true : false;

  bool isObscure = false;
  bool isRememberMe = false;

  toggleObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  toggleRememberMe() {
    isRememberMe = !isRememberMe;
    notifyListeners();
  }

  Future<bool> signIn({
    required String phone,
    required String password,
    required BuildContext context,
  }) async {
    // LoginResponseModel data = await loginRxObj
    //     .login(phone: phone, password: password)
    //     .waitingForFuture(context);

    // return data.success == true ? true : false;
    return true;
  }

  checklogin(bool value) {
    isLogin = value;

    notifyListeners();
  }
}
