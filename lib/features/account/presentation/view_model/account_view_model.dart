import 'package:feature_based_mvvm_architecture/features/auth/data/services/login_local_service.dart';
import 'package:feature_based_mvvm_architecture/features/auth/model/local/login_local_model.dart';
import 'package:flutter/material.dart';

class AccountViewModel extends ChangeNotifier {
  LoginLocalModel? accountData;

  AccountViewModel() {
    _loadAccountData();
  }

  void _loadAccountData() {
    accountData = LoginLocalService.getLoginItem();
    notifyListeners();
  }
}
