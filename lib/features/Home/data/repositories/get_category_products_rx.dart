// import 'dart:developer';

// import 'package:feature_based_mvvm_architecture/features/Home/data/services/get_category_products_api.dart';
// import 'package:feature_based_mvvm_architecture/features/product_page/model/common_product_model.dart';
// import 'package:rxdart/rxdart.dart';

// import '../../../../shared/networks/rx_base.dart';

// final class GetCategoryProductsRx extends RxResponseInt<CommonProductModel> {
//   final api = GetCategoryProductsApi.instance;

//   // final categoryProvider = locator<CategoryProvider>();

//   GetCategoryProductsRx({required super.empty, required super.dataFetcher});

//   ValueStream get getCategoryData => dataFetcher.stream;

//   Future<CommonProductModel> getCategoryProducts({dynamic id}) async {
//     try {
//       CommonProductModel categoryModel = await api.getCategoryProducts(id: id);

//       return handleSuccessWithReturn(categoryModel);
//     } catch (error) {
//       return handleErrorWithReturn(error);
//     }
//   }

//   @override
//   handleSuccessWithReturn(CommonProductModel data) {
//     // categoryProvider.setCategories(data);

//     log("dsdsadsadasd");

//     return super.handleSuccessWithReturn(data);
//   }
// }
