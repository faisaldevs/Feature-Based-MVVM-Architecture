// import 'package:dio/dio.dart';
// import 'package:feature_based_mvvm_architecture/features/product_page/model/common_product_model.dart';
// import 'package:feature_based_mvvm_architecture/shared/networks/dio/dio.dart';
// import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
// import 'package:feature_based_mvvm_architecture/shared/networks/exception_handler/data_source.dart';

// final class BestSellingApi {
//   BestSellingApi._internal();
//   static final BestSellingApi _singleton = BestSellingApi._internal();
//   static BestSellingApi get instance => _singleton;

//   Future<CommonProductModel> getNewArrival() async {
//     try {
//       Response response = await getHttp(Endpoints.getNewArrival());

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return CommonProductModel.fromJson(response.data);
//       } else {
//         throw DataSource.DEFAULT.getFailure();
//       }
//     } catch (error) {
//       throw ErrorHandler.handle(error).failure;
//     }
//   }
// }
