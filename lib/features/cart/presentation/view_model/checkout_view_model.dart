import 'package:flutter/material.dart';

class CheckoutViewModel extends ChangeNotifier {
  Map shippingDetals = {};

  String selectedLocation = "Select Location";
  List<String> locationList = [
    "Select Location",
    "Inside of Dhaka",
    "Outside of Dhaka",
  ];

  toggleLocation(value) {
    selectedLocation = value;
    notifyListeners();
  }

  // submitPayment() async {
  //   // Ensure navigation happens only once
  //   bool isNavigating = false;

  //   await cartCheckoutRxObj
  //       .getProductAdd(
  //     userId: 81,
  //     productList: [
  //       {"id": 123, "quantity": 1}
  //     ],
  //     name: "01757820777",
  //     phone: "01757820777",
  //     shippingDis: "Inside of Dhaka",
  //     address: "test",
  //     subTotalPrice: 999,
  //     totalPrice: "1069.00",
  //     paymentStatus: 1,
  //     status: 1,
  //     seen: 1,
  //     qut: 1,
  //     deliveryCharge: 70,
  //   )
  //       .then((res) {
  //     if (res.success == true) {
  //       showDialog(
  //         context: context,
  //         builder: (context) {
  //           if (!isNavigating) {
  //             isNavigating = true;
  //             Future.delayed(const Duration(milliseconds: 300), () {
  //               Navigator.of(context).pop(); // Close the dialog
  //               context.read<CheckoutProvider>().nextStep(); // Reset steps
  //             });
  //           }

  //           return Dialog(
  //             child: Container(
  //               padding: EdgeInsets.all(30.sp),
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(6.r),
  //                 color: AppColors.cFFFFFF,
  //               ),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   SvgPicture.asset(Assets.icons.doneIcon),
  //                   UIHelper.verticalSpaceSmall,
  //                   Text(
  //                     'Success! \n Your order is now confirmed.',
  //                     textAlign: TextAlign.center,
  //                     style: TextFontStyle.headline12w500c0C89BFstyleLexend
  //                         .copyWith(fontSize: 15.sp),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       );
  //     }
  //   });
  // }
  // Future<bool> submitPayment({
  //   required dynamic userId,
  //   required List<Map<String, dynamic>> productList,
  //   required String name,
  //   required String phone,
  //   required String shippingDis,
  //   required String address,
  //   required int subTotalPrice,
  //   required String totalPrice,
  //   required int paymentStatus,
  //   required int status,
  //   required int seen,
  //   required int qut,
  //   required int deliveryCharge,
  // }) async {
  //   final response = await cartCheckoutRxObj.getProductAdd(
  //     userId: 81,
  //     productList: [
  //       {"id": 123, "quantity": 1}
  //     ],
  //     name: "01757820777",
  //     phone: "01757820777",
  //     shippingDis: "Inside of Dhaka",
  //     address: "test",
  //     subTotalPrice: 999,
  //     totalPrice: "1069.00",
  //     paymentStatus: 1,
  //     status: 1,
  //     seen: 1,
  //     qut: 1,
  //     deliveryCharge: 70,
  //   );

  //   return response.success == true;
  // }

  // Future<bool> submitPayment({
  //   required int userId,
  //   required List<Map<String, dynamic>> productList,
  //   required String name,
  //   required String phone,
  //   required String shippingDis,
  //   required String address,
  //   required int subTotalPrice,
  //   required String totalPrice,
  //   required int paymentStatus,
  //   required int status,
  //   required int seen,
  //   required int qut,
  //   required int deliveryCharge,
  // }) async {
  //   // Log the input data
  //   // AppLogger.i("🚀 submitPayment called with data:", {
  //   //   "userId": userId,
  //   //   // userId: 81,
  //   //   productList: [
  //   //     {"id": 123, "quantity": 1}
  //   //   ],
  //   //   name: "01757820777",
  //   //   phone: "01757820777",
  //   //   shippingDis: "Inside of Dhaka",
  //   //   address: "test",
  //   //   subTotalPrice: 999,
  //   //   totalPrice: "1069.00",
  //   //   paymentStatus: 1,
  //   //   status: 1,
  //   //   seen: 1,
  //   //   qut: 1,
  //   //   deliveryCharge: 70,
  //   // });

  //   // final response = await cartCheckoutRxObj.getProductAdd(
  //   //   userId: userId,
  //   //   productList: productList,
  //   //   name: name,
  //   //   phone: phone,
  //   //   shippingDis: shippingDis,
  //   //   address: address,
  //   //   subTotalPrice: subTotalPrice,
  //   //   totalPrice: totalPrice,
  //   //   paymentStatus: paymentStatus,
  //   //   status: status,
  //   //   seen: seen,
  //   //   qut: qut,
  //   //   deliveryCharge: deliveryCharge,
  //   // );

  //   if (response.success == true) {
  //     List<CartItems> cartItems = List<CartItems>.from(
  //       hiveBox.get(kKeyCartItems, defaultValue: []),
  //     );

  //     // Extract item IDs from the productList
  //     List<int> itemIdsToRemove =
  //         productList.map<int>((e) {
  //           return e['id']; // Ensure it's a String
  //         }).toList();

  //     await CartLocalService.removeFromCart(
  //       cartItems: cartItems,
  //       itemIdsToRemove: itemIdsToRemove,
  //     );
  //   }
  //   // Log response
  //   AppLogger.i("✅ submitPayment response: ${response.success}");

  //   return response.success == true;
  // }
}
