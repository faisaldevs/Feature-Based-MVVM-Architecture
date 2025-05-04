import 'dart:developer';

import 'package:feature_based_mvvm_architecture/features/Home/data/services/all_sub_category_api.dart';
import 'package:feature_based_mvvm_architecture/features/Home/model/all_sub_category_response_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../shared/networks/rx_base.dart';

final class GetAllSubCategoryRx
    extends RxResponseInt<List<AllSubCategoryResponseModel>> {
  final api = GetAllSubCategoryApi.instance;

  // final categoryProvider = locator<CategoryProvider>();

  GetAllSubCategoryRx({required super.empty, required super.dataFetcher});

  ValueStream get getCategoryData => dataFetcher.stream;

  Future<List<AllSubCategoryResponseModel>> getAllSubCategory() async {
    try {
      List<AllSubCategoryResponseModel> categoryModel =
          await api.getAllSubCategory();

      return handleSuccessWithReturn(categoryModel);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }

  @override
  handleSuccessWithReturn(List<AllSubCategoryResponseModel> data) {
    // categoryProvider.setCategories(data);

    log("dsdsadsadasd");

    return super.handleSuccessWithReturn(data);
  }
}
