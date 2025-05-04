import 'package:dio/dio.dart';
import 'package:feature_based_mvvm_architecture/features/category/model/category_response_model.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/dio/dio.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/exception_handler/data_source.dart';

final class GetCategoryApi {
  GetCategoryApi._internal();
  static final GetCategoryApi _singleton = GetCategoryApi._internal();
  static GetCategoryApi get instance => _singleton;

  Future<List<CategoryResponseModel>> getCategory({
    required int? category,
  }) async {
    try {
      Response response = await getHttp(
        Endpoints.getCategory(category: category),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> data = response.data;
        return data
            .map((item) => CategoryResponseModel.fromJson(item))
            .toList();
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}
