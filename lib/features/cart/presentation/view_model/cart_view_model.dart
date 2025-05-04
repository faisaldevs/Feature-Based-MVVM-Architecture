import 'package:feature_based_mvvm_architecture/app/constants/app_constants.dart';
import 'package:feature_based_mvvm_architecture/database/model/cart/cart_items.dart';
import 'package:feature_based_mvvm_architecture/database/service/cart/cart_local_service.dart';
import 'package:feature_based_mvvm_architecture/utils/di.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  final Map<dynamic, int> _itemQuantities = {}; // key: itemId, value: quantity
  final Set<int> _selectedItemIds = {};

  List<CartItems> cartItems = [];

  void loadCartItems() {
    cartItems =
        (hiveBox.get(kKeyCartItems, defaultValue: []) as List<dynamic>)
            .cast<CartItems>();
    notifyListeners();
  }

  void refreshCart() {
    loadCartItems();
    notifyListeners();
  }

  CartViewModel() {
    _initializeQuantities();
  }

  void _initializeQuantities() {
    final List<CartItems> cartItems = _getCartItems();
    for (var item in cartItems) {
      _itemQuantities[item.id] = item.quantity;
    }
  }

  List<CartItems> _getCartItems() {
    return (hiveBox.get(kKeyCartItems, defaultValue: []) as List<dynamic>)
        .cast<CartItems>();
  }

  /// ========== Quantity Logic ==========

  int getQuantity(int itemId) => _itemQuantities[itemId] ?? 1;

  Future<void> increaseQuantity(int itemId) async {
    _itemQuantities[itemId] = getQuantity(itemId) + 1;
    await CartLocalService.updateItemQuantityById(
      itemId: itemId,
      quantity: _itemQuantities[itemId]!,
    );
    notifyListeners();
  }

  Future<void> decreaseQuantity(int itemId) async {
    final currentQty = getQuantity(itemId);
    if (currentQty > 1) {
      _itemQuantities[itemId] = currentQty - 1;
      await CartLocalService.updateItemQuantityById(
        itemId: itemId,
        quantity: _itemQuantities[itemId]!,
      );
      notifyListeners();
    }
  }

  /// ========== Selection Logic ==========

  bool isSelected(int itemId) => _selectedItemIds.contains(itemId);

  void toggleSelection(int itemId, bool isSelected) {
    isSelected ? _selectedItemIds.add(itemId) : _selectedItemIds.remove(itemId);
    notifyListeners();
  }

  void selectAll() {
    _selectedItemIds.addAll(_getCartItems().map((e) => e.id));
    notifyListeners();
  }

  void deselectAll() {
    _selectedItemIds.clear();
    notifyListeners();
  }

  bool isAllSelected() {
    final allIds = _getCartItems().map((e) => e.id).toSet();
    return _selectedItemIds.length == allIds.length;
  }

  Set<int> get selectedItemIds => _selectedItemIds;

  /// ========== Total Price ==========

  double get totalPrice {
    final cartItems = _getCartItems();
    double total = 0.0;
    for (var item in cartItems) {
      if (_selectedItemIds.contains(item.id)) {
        total += item.price * (item.quantity);
      }
    }
    return total;
  }

  List<Map<String, dynamic>> selectedItem() {
    List<Map<String, dynamic>> productData = [];

    for (final e in cartItems) {
      if (selectedItemIds.contains(e.id)) {
        productData.add({"id": e.id, "quantity": e.quantity});
      }
    }

    return productData;
  }
}
