import 'package:hive/hive.dart';

part 'login_local_model.g.dart';

@HiveType(typeId: 3)
class LoginLocalModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String userName;

  @HiveField(2)
  final String userEmail;

  @HiveField(3)
  final String userPhone;

  @HiveField(4)
  final String image;

  LoginLocalModel({
    required this.id,
    required this.userName,
    required this.userEmail,
    required this.userPhone,
    required this.image,
  });

  // CopyWith method
  LoginLocalModel copyWith({
    required int id,
    String? userName,
    String? userEmail,
    String? userPhone,
    String? image,
  }) {
    return LoginLocalModel(
      id: id,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      userPhone: userPhone ?? this.userPhone,
      image: image ?? this.image,
    );
  }

  // Optional: JSON serialization
  factory LoginLocalModel.fromJson(Map<String, dynamic> json) {
    return LoginLocalModel(
      id: json['id'] ?? '',
      userName: json['userName'] ?? '',
      userEmail: json['userEmail'] ?? '',
      userPhone: json['userPhone'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'userEmail': userEmail,
      'userPhone': userPhone,
      'image': image,
    };
  }
}
