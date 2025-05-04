import 'package:dio/dio.dart';
import 'package:feature_based_mvvm_architecture/features/auth/model/login_response_model.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/dio/dio.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/exception_handler/data_source.dart';

final class LoginApi {
  LoginApi._internal();
  static final LoginApi _singleton = LoginApi._internal();
  static LoginApi get instance => _singleton;

  Future<LoginResponseModel> login({
    required String phone,
    required String password,
  }) async {
    try {
      dynamic data = {"userPhone": phone, "userPass": password};
      Response response = await postHttp(Endpoints.login(), data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = LoginResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}
