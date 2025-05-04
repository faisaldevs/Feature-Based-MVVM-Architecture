// ignore_for_file: constant_identifier_names

const String url = "";
const String imageUrl = "";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

final class Endpoints {
  Endpoints._();
  //backend_url
  static String getSlider() => "/getAllSliders?status=1";
  static String getProductAdd({required String id}) => "/getProductAddsById/1";
  static String getAllCategory() => "/getAllCategories";

  static String getSubCategoryItem({required dynamic id}) =>
      "/getAllProduct?subcategory=$id";

  static String getCategoryProducts({required dynamic id}) =>
      "/getAllProduct?category=$id";

  static String getSearch({required dynamic search}) =>
      "/getAllProduct?search=$search&type=Name";

  static String getNewArrival() => "/getAllProduct?new_arrival=1";
  static String getProductById({required String id}) => "/getProductById/$id";

  static String getCategory({required dynamic category}) =>
      "/getAllCategories?category=$category";

  static String login() => "/login";
  static String signup() => "/signup";
  static String cartCheckout() => "/createorder";
  static String getOrderData() => "/getOrderList";
  static String getAllSubCategory() => "/getAllSubcategories";
}
