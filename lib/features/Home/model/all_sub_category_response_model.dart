import 'dart:convert';

class AllSubCategoryResponseModel {
  int? id;
  String? name;
  String? nameBn;
  String? slug;
  String? image;
  int? categoryId;
  DateTime? createDate;
  DateTime? updatedAt;

  AllSubCategoryResponseModel({
    this.id,
    this.name,
    this.nameBn,
    this.slug,
    this.image,
    this.categoryId,
    this.createDate,
    this.updatedAt,
  });

  AllSubCategoryResponseModel copyWith({
    int? id,
    String? name,
    String? nameBn,
    String? slug,
    String? image,
    int? categoryId,
    DateTime? createDate,
    DateTime? updatedAt,
  }) =>
      AllSubCategoryResponseModel(
        id: id ?? this.id,
        name: name ?? this.name,
        nameBn: nameBn ?? this.nameBn,
        slug: slug ?? this.slug,
        image: image ?? this.image,
        categoryId: categoryId ?? this.categoryId,
        createDate: createDate ?? this.createDate,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory AllSubCategoryResponseModel.fromRawJson(String str) =>
      AllSubCategoryResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllSubCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      AllSubCategoryResponseModel(
        id: json["id"],
        name: json["name"],
        nameBn: json["name_bn"],
        slug: json["slug"],
        image: json["image"],
        categoryId: json["categoryId"],
        createDate: json["create_date"] == null
            ? null
            : DateTime.parse(json["create_date"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_bn": nameBn,
        "slug": slug,
        "image": image,
        "categoryId": categoryId,
        "create_date": createDate?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
