import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:feature_based_mvvm_architecture/features/auth/data/services/signup_api.dart';
import 'package:feature_based_mvvm_architecture/features/auth/model/signup_response_model.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/rx_base.dart';
import 'package:feature_based_mvvm_architecture/utils/toast.dart';
import 'package:rxdart/streams.dart';

final class SignupRx extends RxResponseInt<SignupResponseModel> {
  final api = SignupApi.instance;

  SignupRx({required super.empty, required super.dataFetcher});
  ValueStream get getFileData => dataFetcher.stream;

  Future<SignupResponseModel> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      SignupResponseModel data = await api.signup(
        email: email,
        name: name,
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
    SignupResponseModel response = data;
    String? message = data.message;
    // await appData.write(kKeyAccessToken, accessToken);
    // await appData.write(kKeyIsLoggedIn, true);
    // DioSingleton.instance.update(accessToken!);
    ToastUtil.showShortToast('$message ✔');
    return response;
  }

  @override
  handleErrorWithReturn(error) {
    SignupResponseModel errorResponse = SignupResponseModel();
    if (error is DioException) {
      if (error.response != null && error.response!.statusCode == 422) {
        final errorData = error.response!.data;
        final errorMessage =
            errorData['message'] ?? "An unknown error occurred";
        ToastUtil.showLongToast(errorMessage);
      } else if (error.response!.statusCode == 404) {
        final errorData = error.response!.data;
        final errorMessage =
            errorData['message'] ?? "An unknown error occurred";

        ToastUtil.showLongToast(errorMessage);
      } else {
        final errorData = error.response!.data;
        final errorMessage =
            errorData['message'] ?? "An unknown error occurred";
        ToastUtil.showLongToast(errorMessage);
      }
    } else {
      // log("Error ====> $error");
    }

    dataFetcher.sink.addError(error);
    return errorResponse;
  }
}
