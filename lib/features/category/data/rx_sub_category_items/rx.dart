// import 'package:feature_based_mvvm_architecture/features/product_page/model/common_product_model.dart';
// import 'package:rxdart/rxdart.dart';

// import '../../../../shared/networks/rx_base.dart';
// import 'api.dart';

// final class SubCategoryItemRx extends RxResponseInt<CommonProductModel> {
//   final api = SubCategoryItemApi.instance;

//   // final categoryProvider = locator<CategoryProvider>();

//   SubCategoryItemRx({required super.empty, required super.dataFetcher});

//   ValueStream get getCategoryData => dataFetcher.stream;

//   Future<CommonProductModel> getSubCategoryItem({required dynamic id}) async {
//     try {
//       CommonProductModel categoryModel = await api.getSubCategoryItem(id: id);

//       return handleSuccessWithReturn(categoryModel);
//     } catch (error) {
//       return handleErrorWithReturn(error);
//     }
//   }

//   // @override
//   // handleErrorWithReturn(error) {
//   //   AppLogger.e("Sub Catagory Error", [
//   //     error,
//   //   ]);
//   //   nav.toProduct();
//   //   return super.handleErrorWithReturn(error);
//   // }
// }
