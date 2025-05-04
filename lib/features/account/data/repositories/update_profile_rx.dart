// import 'dart:developer';

// import 'package:feature_based_mvvm_architecture/app/constants/app_constants.dart';
// import 'package:feature_based_mvvm_architecture/features/auth/data/services/ProfileUpdate_api.dart';
// import 'package:feature_based_mvvm_architecture/features/auth/data/services/ProfileUpdate_local_service.dart';
// import 'package:feature_based_mvvm_architecture/features/auth/model/local/ProfileUpdate_local_model.dart';
// import 'package:feature_based_mvvm_architecture/features/auth/model/ProfileUpdate_response_model.dart';
// import 'package:feature_based_mvvm_architecture/shared/networks/dio/dio.dart';
// import 'package:feature_based_mvvm_architecture/shared/networks/rx_base.dart';
// import 'package:feature_based_mvvm_architecture/utils/di.dart';
// import 'package:feature_based_mvvm_architecture/utils/toast.dart';
// import 'package:rxdart/streams.dart';

// final class ProfileUpdateRx extends RxResponseInt<ProfileUpdateResponseModel> {
//   final api = ProfileUpdateApi.instance;

//   ProfileUpdateRx({required super.empty, required super.dataFetcher});
//   ValueStream get getFileData => dataFetcher.stream;

//   Future<ProfileUpdateResponseModel> ProfileUpdate({
//     required String phone,
//     required String password,
//   }) async {
//     try {
//       ProfileUpdateResponseModel data = await api.ProfileUpdate(
//         phone: phone,
//         password: password,
//       );
//       return await handleSuccessWithReturn(data);
//     } catch (error) {
//       return await handleErrorWithReturn(error);
//     }
//   }

//   @override
//   handleSuccessWithReturn(data) async {
//     log('message');
//     ProfileUpdateResponseModel response = data;
//     String? accessToken = data.token;
//     await appData.write(kKeyAccessToken, accessToken);
//     await appData.write(kKeyUserID, data.user?[0].id);
//     await appData.write(kKeyIsLoggedIn, true);

//     final item = ProfileUpdateLocalModel(
//       id: response.user![0].id!,
//       image: response.user![0].image.toString(),
//       userEmail: response.user![0].userEmail.toString(),
//       userName: response.user![0].userName.toString(),
//       userPhone: response.user![0].userPhone.toString(),
//     );

//     await ProfileUpdateLocalService.addToProfileUpdate(item: item);

//     DioSingleton.instance.update(accessToken!);
//     ToastUtil.showShortToast('ProfileUpdate Success ✔');
//     return response;
//   }

//   @override
//   handleErrorWithReturn(error) {
//     ToastUtil.showShortToast('ProfileUpdate Failuar ❌');

//     ProfileUpdateResponseModel errorResponse = ProfileUpdateResponseModel();
//     // if (error is DioException) {
//     //   if (error.response != null && error.response!.statusCode == 422) {
//     //     final errorData = error.response!.data;
//     //     final errorMessage =
//     //         errorData['message'] ?? "An unknown error occurred";
//     //     ToastUtil.showLongToast(errorMessage);
//     //   } else if (error.response!.statusCode == 404) {
//     //     final errorData = error.response!.data;
//     //     final errorMessage =
//     //         errorData['message'] ?? "An unknown error occurred";

//     //     ToastUtil.showLongToast(errorMessage);
//     //   } else {
//     //     final errorData = error.response!.data;
//     //     final errorMessage =
//     //         errorData['message'] ?? "An unknown error occurred";
//     //     ToastUtil.showLongToast(errorMessage);
//     //   }
//     // } else {
//     //   // log("Error ====> $error");
//     // }

//     dataFetcher.sink.addError(error);
//     return errorResponse;
//   }
// }
