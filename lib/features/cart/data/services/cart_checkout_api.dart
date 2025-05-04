import 'package:dio/dio.dart';
import 'package:feature_based_mvvm_architecture/features/cart/model/cart_checkout_response_model.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/dio/dio.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/endpoints.dart';
import 'package:feature_based_mvvm_architecture/shared/networks/exception_handler/data_source.dart';

final class CartCheckoutApi {
  CartCheckoutApi._internal();
  static final CartCheckoutApi _singleton = CartCheckoutApi._internal();
  static CartCheckoutApi get instance => _singleton;

  Future<CartCheckoutResponseModel> cartCheckout({
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
      final Map<String, dynamic> requestBody = {
        "user_id": userId,
        "product_id": productList,
        "name": name,
        "phone": phone,
        "shipping_dis": shippingDis,
        "shipping_subDis": shippingSubDis,
        "address": address,
        "sub_total_price": subTotalPrice,
        "total_price": totalPrice,
        "coupon_discount": couponDiscount,
        "payment_status": paymentStatus,
        "status": status,
        "payment_method": paymentMethod,
        "seen": seen,
        "qut": qut,
        "color": color,
        "size": size,
        "delivery_charge": deliveryCharge,
      };

      Response response = await postHttp(Endpoints.cartCheckout(), requestBody);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return CartCheckoutResponseModel.fromJson(response.data);
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (error) {
      throw ErrorHandler.handle(error).failure;
    }
  }
}
