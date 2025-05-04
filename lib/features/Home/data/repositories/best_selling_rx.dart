// import 'package:feature_based_mvvm_architecture/features/product_page/model/common_product_model.dart';
// import 'package:rxdart/rxdart.dart';

// import '../../../../shared/networks/rx_base.dart';
// import '../services/best_selling_api.dart';

// final class BestSellingRx extends RxResponseInt<CommonProductModel> {
//   final api = BestSellingApi.instance;

//   BestSellingRx({required super.empty, required super.dataFetcher});

//   ValueStream get getSliderData => dataFetcher.stream;

//   Future<CommonProductModel> getNewArrival() async {
//     try {
//       CommonProductModel sliderModel = await api.getNewArrival();
//       return handleSuccessWithReturn(sliderModel);
//     } catch (error) {
//       return handleErrorWithReturn(error);
//     }
//   }
// }
