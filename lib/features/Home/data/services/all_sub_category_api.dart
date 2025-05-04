import 'package:dio/dio.dart';
import 'package:feature_based_mvvm_architecture/features/Home/model/all_sub_category_response_model.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/dio/dio.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/exception_handler/data_source.dart';

final class GetAllSubCategoryApi {
  GetAllSubCategoryApi._internal();
  static final GetAllSubCategoryApi _singleton =
      GetAllSubCategoryApi._internal();
  static GetAllSubCategoryApi get instance => _singleton;

  Future<List<AllSubCategoryResponseModel>> getAllSubCategory() async {
    try {
      Response response = await getHttp(Endpoints.getAllSubCategory());

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> data = response.data;
        return data
            .map((item) => AllSubCategoryResponseModel.fromJson(item))
            .toList();
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}
