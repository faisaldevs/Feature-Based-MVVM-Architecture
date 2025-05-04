import 'package:dio/dio.dart';
import 'package:feature_based_mvvm_architecture/features/auth/model/signup_response_model.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/dio/dio.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/exception_handler/data_source.dart';

final class SignupApi {
  SignupApi._internal();
  static final SignupApi _singleton = SignupApi._internal();
  static SignupApi get instance => _singleton;

  Future<SignupResponseModel> signup({
    required String phone,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      dynamic data = {
        "userName": name,
        "userPhone": phone,
        "userEmail": email,
        "userPass": password,
        "userType": "2",
      };
      Response response = await postHttp(Endpoints.signup(), data);

      if (response.statusCode == 201 || response.statusCode == 200) {
        var data = SignupResponseModel.fromJson(response.data);

        return data;
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}
