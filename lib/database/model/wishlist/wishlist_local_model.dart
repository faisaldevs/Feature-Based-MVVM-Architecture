import 'package:hive/hive.dart';

part 'wishlist_local_model.g.dart';

@HiveType(typeId: 1)
class WishlistLocalModel {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String name;
  
  @HiveField(2)
  final double currentPrice;
  
  @HiveField(3)
  final double regularPrice;
  
  @HiveField(4)
  final String imageUrl;
  
  @HiveField(5)
  final double ratting;
  
  @HiveField(6)
  final double review;
  
  @HiveField(7)
  final String discount;

  WishlistLocalModel({
    required this.id,
    required this.name,
    required this.currentPrice,
    required this.regularPrice,
    required this.imageUrl,
    required this.ratting,
    required this.review,
    required this.discount,
  });

  // CopyWith method
  WishlistLocalModel copyWith({
    String? id,
    String? name,
    double? currentPrice,
    double? regularPrice,
    String? imageUrl,
    double? ratting,
    double? review,
    String? discount,
  }) {
    return WishlistLocalModel(
      id: id ?? this.id,
      name: name ?? this.name,
      currentPrice: currentPrice ?? this.currentPrice,
      regularPrice: regularPrice ?? this.regularPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      ratting: ratting ?? this.ratting,
      review: review ?? this.review,
      discount: discount ?? this.discount,
    );
  }
}
