import 'package:feature_based_mvvm_architecture/app/router/config/navigation_service.dart';
import 'package:feature_based_mvvm_architecture/features/Home/model/all_sub_category_response_model.dart';
import 'package:feature_based_mvvm_architecture/features/category/model/sub_category_item_response_model.dart';
import 'package:feature_based_mvvm_architecture/utils/di.dart';

/// Global instance of NavigationService
final nav = locator<NavigationService>();

extension NavHelpers on NavigationService {
  void toHome() => go('/');
  void toLogin() => push('/login');
  void toForgotPassEmail() => pushNamed('forgotPassEmail');
  void toForgotPassEmailOtp() => pushNamed('forgotPassEmailOtp');
  void toCreateNewPass() => pushNamed('createNewPass');
  void toCart() => goNamed('cart');
  void toProduct({required String title}) =>
      pushNamedWithExtra('product', extra: title);

  void toAccountDetails() => pushNamed('accountDetails');
  void toUpdateAccountInfo() => pushNamed('updateAccountInfo');
  void toChangePassword() => pushNamed('changePassword');
  void toNotificationSetting() => pushNamed('notificationSetting');
  void toWelcome() => pushNamed('welcome');
  void toSignup() => pushNamed('signup');
  void toNavigation({int? index}) => gowithExtra('/navigation', extra: index);
  void toNotification() => pushNamed('notification');
  void toReview() => pushNamed('review');
  void toTrackOrder() => pushNamed('trackOrder');
  void toOrder() => pushNamed('order');
  void toSearch() => pushNamed('search');
  void toWishlist() => pushNamed('wishlist');

  void toProductDetails({Object? data}) {
    pushNamedWithExtra('productDetails', extra: data);
  }

  void toSeeAllProductList({List<Product>? products, String? title}) {
    pushNamedWithExtra(
      'seeAllProductList',
      extra: {'products': products, 'title': title},
    );
  }

  void toSeeAllCategoryList({
    List<AllSubCategoryResponseModel>? products,
    String? title,
  }) {
    pushNamedWithExtra(
      'seeAllCategoryList',
      extra: {'products': products, 'title': title},
    );
  }

  void goBack() => pop();
}
