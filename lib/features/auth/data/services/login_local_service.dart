import 'dart:developer';

import 'package:feature_based_mvvm_architecture/app/constants/app_constants.dart';
import 'package:feature_based_mvvm_architecture/features/auth/model/local/login_local_model.dart';
import 'package:feature_based_mvvm_architecture/utils/di.dart';

class LoginLocalService {
  static Future<void> addToLogin({required LoginLocalModel item}) async {
    log("LoginLocalService: Saving login item");

    // Store the item under a constant key
    await hiveBox.put(kKeyLoginitems, item);

    log("Login info saved: ${item.toJson()}");
  }

  static LoginLocalModel? getLoginItem() {
    return hiveBox.get(kKeyLoginitems);
  }

  static Future<void> removeLoginItem() async {
    await hiveBox.delete(kKeyLoginitems);
    log("Login info removed.");
  }

  static bool isLoggedIn() {
    return hiveBox.containsKey(kKeyLoginitems);
  }
}
