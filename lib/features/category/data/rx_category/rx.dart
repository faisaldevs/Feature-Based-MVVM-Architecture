import 'dart:developer';

import 'package:feature_based_mvvm_architecture/features/category/model/category_response_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../shared/networks/rx_base.dart';
import 'api.dart';

final class GetCategoryRX extends RxResponseInt<List<CategoryResponseModel>> {
  final api = GetCategoryApi.instance;

  // final categoryProvider = locator<CategoryProvider>();

  GetCategoryRX({required super.empty, required super.dataFetcher});

  ValueStream get getCategoryData => dataFetcher.stream;

  Future<List<CategoryResponseModel>> getCategory({int? category}) async {
    try {
      List<CategoryResponseModel> categoryModel = await api.getCategory(
        category: category,
      );

      return handleSuccessWithReturn(categoryModel);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(List<CategoryResponseModel> data) {
    // categoryProvider.setCategories(data);

    log("dsdsadsadasd");

    return super.handleSuccessWithReturn(data);
  }
}
