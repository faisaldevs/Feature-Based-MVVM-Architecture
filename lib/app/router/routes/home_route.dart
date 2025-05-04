import 'package:feature_based_mvvm_architecture/features/Home/model/all_sub_category_response_model.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/view/see_all_category_list_screen.dart';
import 'package:feature_based_mvvm_architecture/features/Home/presentation/view/see_all_product_list_widget.dart';
import 'package:feature_based_mvvm_architecture/features/category/model/sub_category_item_response_model.dart';
import 'package:feature_based_mvvm_architecture/navigation_screen.dart';
import 'package:go_router/go_router.dart';

class HomeRoute {
  static List<GoRoute> get routes {
    return [
      GoRoute(
        path: '/navigation',
        name: 'navigation', // Added name
        builder: (context, state) {
          final index = state.extra as int? ?? 0;
          return NavigationScreen(initialIndex: index);
        },
      ),

      GoRoute(
        path: '/seeAllProductList',
        name: 'seeAllProductList',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final List<dynamic> products = data['products'];
          final String title = data['title'];

          return SeeAllProductListWidget(
            items: products as List<Product>,
            title: title,
          );
        },
      ),
      GoRoute(
        path: '/seeAllCategoryList',
        name: 'seeAllCategoryList',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final List<dynamic> products = data['products'];
          final String title = data['title'];

          return SeeAllCategoryListScreen(
            items: products as List<AllSubCategoryResponseModel>,
            title: title,
          );
        },
      ),
    ];
  }
}

// goNavigation(BuildContext context) => context.go("/navigation");
// goNotification(BuildContext context) => context.pushNamed("notification");
// goProductDetails(BuildContext context, {dynamic productData}) =>
//     context.pushNamed("productDetails", extra: productData);
// goReview(BuildContext context) => context.pushNamed("review");
// goTrackOrder(BuildContext context) => context.pushNamed("trackOrder");
// goOrder(BuildContext context) => context.pushNamed("order");
// goSearch(BuildContext context) => context.pushNamed("search");
// goWishlist(BuildContext context) => context.pushNamed("wishlist");

// // goSeeAllProductList(BuildContext context,
// //         {List<Product>? products, String? title}) =>
// //     context.pushNamed("seeAllProductList", extra: products);
// // goSeeAllProductList(BuildContext context,
// //     {List<Product>? products, String? title}) {
// //   context.pushNamed(
// //     "seeAllProductList",
// //     extra: {
// //       'products': products,
// //       'title': title,
// //     },
// //   );
// // }
