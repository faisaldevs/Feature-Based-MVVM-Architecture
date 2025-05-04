// import 'package:dio/dio.dart';
// import 'package:feature_based_mvvm_architecture/features/product_page/model/common_product_model.dart';
// import 'package:feature_based_mvvm_architecture/shared/networks/dio/dio.dart';
// import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
// import 'package:feature_based_mvvm_architecture/shared/networks/exception_handler/data_source.dart';

// final class GetCategoryProductsApi {
//   GetCategoryProductsApi._internal();
//   static final GetCategoryProductsApi _singleton =
//       GetCategoryProductsApi._internal();
//   static GetCategoryProductsApi get instance => _singleton;

//   Future<CommonProductModel> getCategoryProducts({dynamic id}) async {
//     try {
//       Response response = await getHttp(Endpoints.getCategoryProducts(id: id));

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         // List<dynamic> data = response.data;

//         return CommonProductModel.fromJson(response.data);
//       } else {
//         throw DataSource.DEFAULT.getFailure();
//       }
//     } catch (error) {
//       throw ErrorHandler.handle(error).failure;
//     }
//   }
// }
