import 'package:feature_based_mvvm_architecture/features/Home/model/slider_model_response.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../shared/networks/rx_base.dart';
import '../services/slider_api.dart';

final class GetSliderRX extends RxResponseInt<List<SliderModelResponse>> {
  final api = GetSliderApi.instance;

  GetSliderRX({required super.empty, required super.dataFetcher});

  ValueStream get getSliderData => dataFetcher.stream;

  Future<List<SliderModelResponse>> getSlider() async {
    try {
      List<SliderModelResponse> sliderModel = await api.getSlider();
      return handleSuccessWithReturn(sliderModel);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
