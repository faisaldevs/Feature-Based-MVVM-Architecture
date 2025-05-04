// import 'package:dio/dio.dart';
// import 'package:feature_based_mvvm_architecture/features/product_page/model/common_product_model.dart';
// import 'package:feature_based_mvvm_architecture/shared/networks/dio/dio.dart';
// import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
// import 'package:feature_based_mvvm_architecture/shared/networks/exception_handler/data_source.dart';

// final class SubCategoryItemApi {
//   SubCategoryItemApi._internal();
//   static final SubCategoryItemApi _singleton = SubCategoryItemApi._internal();
//   static SubCategoryItemApi get instance => _singleton;

//   Future<CommonProductModel> getSubCategoryItem({required dynamic id}) async {
//     try {
//       Response response = await getHttp(Endpoints.getSubCategoryItem(id: id));

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
