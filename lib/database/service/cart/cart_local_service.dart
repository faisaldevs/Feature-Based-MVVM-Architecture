import 'dart:convert';
import 'dart:developer';

import 'package:feature_based_mvvm_architecture/app/constants/app_constants.dart';
import 'package:feature_based_mvvm_architecture/database/model/cart/cart_items.dart';
import 'package:feature_based_mvvm_architecture/features/category/model/sub_category_item_response_model.dart';
import 'package:feature_based_mvvm_architecture/utils/di.dart';

class CartLocalService {
  CartLocalService();

  /// Add a product to the cart (or increase quantity if already added)
  static Future<void> addToCart({required Product? item}) async {
    List<CartItems> cartItems = List<CartItems>.from(
      hiveBox.get(kKeyCartItems, defaultValue: []),
    );

    CartItems newItem = CartItems(
      id: item!.id!,
      name: item.name ?? 'Unnamed Product',
      price: double.parse(
        json.decode(item.account ?? "")[0]["sale_price"].toString(),
      ),
      imageUrl: item.groupImage ?? [],
      quantity: 1,
    );

    bool itemExists = cartItems.any(
      (existingItem) => existingItem.id == newItem.id,
    );

    if (itemExists) {
      int index = cartItems.indexWhere(
        (existingItem) => existingItem.id == newItem.id,
      );
      cartItems[index] = cartItems[index].copyWith(
        quantity: cartItems[index].quantity + 1,
      );
    } else {
      cartItems.add(newItem);
    }

    await hiveBox.put(kKeyCartItems, cartItems);
    log("Cart Updated: ${cartItems.length} items");
  }

  /// Remove selected items from the cart by their IDs
  static Future<void> removeFromCart({
    required List<CartItems> cartItems,
    required List<int> itemIdsToRemove,
  }) async {
    cartItems.removeWhere((item) => itemIdsToRemove.contains(item.id));
    await hiveBox.put(kKeyCartItems, cartItems);
    log(
      "Removed items: ${itemIdsToRemove.length}, Remaining: ${cartItems.length}",
    );
  }

  /// Update the quantity of a cart item by ID and index
  static Future<void> updateItemQuantity({
    required int itemId,
    required int index,
    required int quantity,
  }) async {
    List<CartItems> cartItems = List<CartItems>.from(
      hiveBox.get(kKeyCartItems, defaultValue: []),
    );

    int localIndex = cartItems.indexWhere((item) => item.id == itemId);

    if (localIndex != -1) {
      cartItems[localIndex] = cartItems[localIndex].copyWith(
        quantity: quantity,
      );
    } else {
      // This block rarely gets used, but we keep it to be safe
      CartItems fallbackItem = cartItems[index];
      cartItems.add(fallbackItem.copyWith(quantity: quantity));
    }

    await hiveBox.put(kKeyCartItems, cartItems);
    log("Cart Updated: ${cartItems.length} items");
  }

  /// Update quantity by ID only (used when index is unknown or irrelevant)
  static Future<void> updateItemQuantityById({
    required int itemId,
    required int quantity,
  }) async {
    List<CartItems> cartItems = List<CartItems>.from(
      hiveBox.get(kKeyCartItems, defaultValue: []),
    );

    int index = cartItems.indexWhere((item) => item.id == itemId);
    if (index != -1) {
      cartItems[index] = cartItems[index].copyWith(quantity: quantity);
    }

    await hiveBox.put(kKeyCartItems, cartItems);
  }
}
