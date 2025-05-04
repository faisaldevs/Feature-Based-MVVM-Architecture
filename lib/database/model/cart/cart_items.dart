import 'package:hive/hive.dart';

part 'cart_items.g.dart';

@HiveType(typeId: 0)
class CartItems {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final int quantity;
  @HiveField(4)
  final List<String> imageUrl;

  CartItems({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  CartItems copyWith({
    int? id,
    String? name,
    double? price,
    int? quantity,
    List<String>? imageUrl,
  }) {
    return CartItems(
      imageUrl: imageUrl ?? this.imageUrl,
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}
