import 'package:feature_based_mvvm_architecture/features/Home/model/product_add_response_model.dart';
import 'package:flutter/material.dart';

class HomeProductAddProvider extends ChangeNotifier {
  List<ProductAddResponseModel> addList = [];

  // getData() {
  //   getAddBannerRxObj.getProductAdd(id: "1").then((value) {
  //     addList.add(value);
  //     notifyListeners();
  //   });
  //   getAddBannerRxObj.getProductAdd(id: "2").then((value) {
  //     addList.add(value);
  //     notifyListeners();
  //   });
  // }
}
