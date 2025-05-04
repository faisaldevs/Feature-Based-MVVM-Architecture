import 'package:dio/dio.dart';
import 'package:feature_based_mvvm_architecture/features/Home/model/product_add_response_model.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/dio/dio.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/exception_handler/data_source.dart';

final class GetAddBannerApi {
  GetAddBannerApi._internal();
  static final GetAddBannerApi _singleton = GetAddBannerApi._internal();
  static GetAddBannerApi get instance => _singleton;

  Future<ProductAddResponseModel> getProductAdd({required String id}) async {
    try {
      Response response = await getHttp(Endpoints.getProductAdd(id: id));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return ProductAddResponseModel.fromJson(response.data);
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}
