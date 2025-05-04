import 'dart:developer';

import 'package:feature_based_mvvm_architecture/app/constants/app_constants.dart';
import 'package:feature_based_mvvm_architecture/features/auth/data/services/login_api.dart';
import 'package:feature_based_mvvm_architecture/features/auth/data/services/login_local_service.dart';
import 'package:feature_based_mvvm_architecture/features/auth/model/local/login_local_model.dart';
import 'package:feature_based_mvvm_architecture/features/auth/model/login_response_model.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/dio/dio.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/rx_base.dart';
import 'package:feature_based_mvvm_architecture/utils/di.dart';
import 'package:feature_based_mvvm_architecture/utils/toast.dart';
import 'package:rxdart/streams.dart';

final class LoginRx extends RxResponseInt<LoginResponseModel> {
  final api = LoginApi.instance;

  LoginRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<LoginResponseModel> login({
    required String phone,
    required String password,
  }) async {
    try {
      LoginResponseModel data = await api.login(
        phone: phone,
        password: password,
      );
      return await handleSuccessWithReturn(data);
    } catch (error) {
      return await handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(data) async {
    log('message');
    LoginResponseModel response = data;
    String? accessToken = data.token;
    await appData.write(kKeyAccessToken, accessToken);
    await appData.write(kKeyUserID, data.user?[0].id);
    await appData.write(kKeyIsLoggedIn, true);

    final item = LoginLocalModel(
      id: response.user![0].id!,
      image: response.user![0].image.toString(),
      userEmail: response.user![0].userEmail.toString(),
      userName: response.user![0].userName.toString(),
      userPhone: response.user![0].userPhone.toString(),
    );

    await LoginLocalService.addToLogin(item: item);

    DioSingleton.instance.update(accessToken!);
    ToastUtil.showShortToast('Login Success ✔');
    return response;
  }

  @override
  handleErrorWithReturn(error) {
    ToastUtil.showShortToast('Login Failuar ❌');

    LoginResponseModel errorResponse = LoginResponseModel();
    // if (error is DioException) {
    //   if (error.response != null && error.response!.statusCode == 422) {
    //     final errorData = error.response!.data;
    //     final errorMessage =
    //         errorData['message'] ?? "An unknown error occurred";
    //     ToastUtil.showLongToast(errorMessage);
    //   } else if (error.response!.statusCode == 404) {
    //     final errorData = error.response!.data;
    //     final errorMessage =
    //         errorData['message'] ?? "An unknown error occurred";

    //     ToastUtil.showLongToast(errorMessage);
    //   } else {
    //     final errorData = error.response!.data;
    //     final errorMessage =
    //         errorData['message'] ?? "An unknown error occurred";
    //     ToastUtil.showLongToast(errorMessage);
    //   }
    // } else {
    //   // log("Error ====> $error");
    // }

    dataFetcher.sink.addError(error);
    return errorResponse;
  }
}
