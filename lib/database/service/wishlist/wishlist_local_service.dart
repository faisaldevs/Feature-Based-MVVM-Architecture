import 'dart:convert';
import 'dart:developer';

import 'package:feature_based_mvvm_architecture/app/constants/app_constants.dart';
import 'package:feature_based_mvvm_architecture/database/model/wishlist/wishlist_local_model.dart';
import 'package:feature_based_mvvm_architecture/features/category/model/sub_category_item_response_model.dart';
import 'package:feature_based_mvvm_architecture/utils/di.dart';

class WishlistLocalService {
  static addToWishlist({required Product? item}) async {
    log("WishlistLocalService");
    List<WishlistLocalModel> wishlistItems = List<WishlistLocalModel>.from(
      hiveBox.get(kKeyWishlistitems, defaultValue: []),
    );

    WishlistLocalModel newItem = WishlistLocalModel(
      id: item?.id.toString() ?? "",
      name: item?.name ?? 'Unnamed Product',
      imageUrl: item?.image.toString() ?? "",
      currentPrice: double.parse(
        json.decode(item?.account ?? "")[0]["sale_price"].toString(),
      ),
      discount: "121",
      ratting: 12,
      regularPrice: double.parse(
        json.decode(item?.account ?? "")[0]["regular_price"].toString(),
      ),
      review: 12,
    );

    bool itemExists = wishlistItems.any(
      (existingItem) => existingItem.id == newItem.id,
    );

    if (!itemExists) {
      wishlistItems.add(newItem);
    }

    await hiveBox.put(kKeyWishlistitems, wishlistItems);
    log("Wishlist Updated: ${wishlistItems.length} items");
  }

  static Future<void> removeFromWishlist({required String productId}) async {
    List<WishlistLocalModel> wishlistItems = List<WishlistLocalModel>.from(
      hiveBox.get(kKeyWishlistitems, defaultValue: []),
    );

    wishlistItems.removeWhere((item) => item.id == productId);

    await hiveBox.put(kKeyWishlistitems, wishlistItems);
    log("Item Removed. Wishlist now has ${wishlistItems.length} items");
  }

  static Future<void> addToRemove({required Product? item}) async {
    log("addToRemove function called");

    List<WishlistLocalModel> wishlistItems = List<WishlistLocalModel>.from(
      hiveBox.get(kKeyWishlistitems, defaultValue: []),
    );

    WishlistLocalModel newItem = WishlistLocalModel(
      id: item?.id.toString() ?? "",
      name: item?.name ?? 'Unnamed Product',
      imageUrl: item?.image.toString() ?? "",
      currentPrice: double.parse(
        json.decode(item?.account ?? "")[0]["sale_price"].toString(),
      ),
      discount: "121",
      ratting: 12,
      regularPrice: double.parse(
        json.decode(item?.account ?? "")[0]["regular_price"].toString(),
      ),
      review: 12,
    );

    bool itemExists = wishlistItems.any(
      (existingItem) => existingItem.id == newItem.id,
    );

    if (itemExists) {
      wishlistItems.removeWhere(
        (existingItem) => existingItem.id == newItem.id,
      );
      log("Item removed from wishlist");
    } else {
      wishlistItems.add(newItem);
      log("Item added to wishlist");
    }

    await hiveBox.put(kKeyWishlistitems, wishlistItems);
    log("Wishlist Updated: ${wishlistItems.length} items");
  }
}
