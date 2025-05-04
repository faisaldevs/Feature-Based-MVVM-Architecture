import 'package:feature_based_mvvm_architecture/app/router/config/route_extention.dart';
import 'package:feature_based_mvvm_architecture/utils/toast.dart';
import 'package:flutter/material.dart';

class SignupViewModel extends ChangeNotifier {
  Future<void> signUp({
    required String phone,
    required String password,
    required String name,
    required String email,
    required BuildContext context,
  }) async {
    // SignupResponseModel data = await signupRxObj
    //     .signup(email: email, name: name, phone: phone, password: password)
    //     .waitingForFuture(context);

    if (true == true) {
      nav.toNavigation();
    } else {
      ToastUtil.showShortToast("data.message!");
    }
  }

  Set passConfig = {};

  togglePasswordConfig(int id) {
    if (passConfig.contains(id)) {
      passConfig.remove(id);
    } else {
      passConfig.add(id);
    }
    notifyListeners();
  }
}
