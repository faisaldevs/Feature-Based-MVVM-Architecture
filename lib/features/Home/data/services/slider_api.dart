import 'package:dio/dio.dart';
import 'package:feature_based_mvvm_architecture/features/Home/model/slider_model_response.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/dio/dio.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/exception_handler/data_source.dart';

final class GetSliderApi {
  GetSliderApi._internal();
  static final GetSliderApi _singleton = GetSliderApi._internal();
  static GetSliderApi get instance => _singleton;

  Future<List<SliderModelResponse>> getSlider() async {
    try {
      Response response = await getHttp(Endpoints.getSlider());

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> data = response.data;
        return data.map((item) => SliderModelResponse.fromJson(item)).toList();
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}
