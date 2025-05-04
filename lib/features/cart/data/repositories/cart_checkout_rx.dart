import 'package:feature_based_mvvm_architecture/features/cart/data/services/cart_checkout_api.dart';
import 'package:feature_based_mvvm_architecture/features/cart/model/cart_checkout_response_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../shared/networks/rx_base.dart';

final class CartCheckoutRx extends RxResponseInt<CartCheckoutResponseModel> {
  final api = CartCheckoutApi.instance;

  CartCheckoutRx({required super.empty, required super.dataFetcher});

  ValueStream get getSliderData => dataFetcher.stream;

  Future<CartCheckoutResponseModel> getProductAdd({
    required int userId,
    required List<Map<String, dynamic>> productList,
    required String name,
    required String phone,
    required String shippingDis,
    required String address,
    required int subTotalPrice,
    required String totalPrice,
    required int paymentStatus,
    required int status,
    required int seen,
    required int qut,
    required int deliveryCharge,
    String shippingSubDis = 'no',
    int couponDiscount = 0,
    String paymentMethod = '',
    String color = '',
    String size = '',
  }) async {
    try {
      final CartCheckoutResponseModel sliderModel = await api.cartCheckout(
        userId: userId,
        productList: productList,
        name: name,
        phone: phone,
        shippingDis: shippingDis,
        address: address,
        subTotalPrice: subTotalPrice,
        totalPrice: totalPrice,
        paymentStatus: paymentStatus,
        status: status,
        seen: seen,
        qut: qut,
        deliveryCharge: deliveryCharge,
        shippingSubDis: shippingSubDis,
        couponDiscount: couponDiscount,
        paymentMethod: paymentMethod,
        color: color,
        size: size,
      );

      return handleSuccessWithReturn(sliderModel);
    } catch (error) {
      return handleErrorWithReturn(error);
    }
  }
}
