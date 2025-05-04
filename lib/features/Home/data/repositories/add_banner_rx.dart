import 'package:feature_based_mvvm_architecture/features/Home/model/product_add_response_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../shared/networks/rx_base.dart';
import '../services/add_banner_api.dart';

final class GetAddBannerRx extends RxResponseInt<ProductAddResponseModel> {
  final api = GetAddBannerApi.instance;

  GetAddBannerRx({required super.empty, required super.dataFetcher});

  ValueStream get getSliderData => dataFetcher.stream;

  Future<ProductAddResponseModel> getProductAdd({required String id}) async {
    try {
      ProductAddResponseModel sliderModel = await api.getProductAdd(id: id);
      return handleSuccessWithReturn(sliderModel);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
