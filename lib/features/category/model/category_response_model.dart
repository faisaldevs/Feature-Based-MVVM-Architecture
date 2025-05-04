import 'dart:convert';

class CategoryResponseModel {
  int? id;
  String? name;
  String? nameBn;
  String? slug;
  String? image;
  DateTime? createDate;
  DateTime? updatedAt;
  List<CategoryResponseModel>? subcategories;
  int? categoryId;

  CategoryResponseModel({
    this.id,
    this.name,
    this.nameBn,
    this.slug,
    this.image,
    this.createDate,
    this.updatedAt,
    this.subcategories,
    this.categoryId,
  });

  factory CategoryResponseModel.fromRawJson(String str) =>
      CategoryResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      CategoryResponseModel(
        id: json["id"],
        name: json["name"],
        nameBn: json["name_bn"],
        slug: json["slug"],
        image: json["image"],
        createDate: json["create_date"] == null
            ? null
            : DateTime.parse(json["create_date"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        subcategories: json["subcategories"] == null
            ? []
            : List<CategoryResponseModel>.from(json["subcategories"]!
                .map((x) => CategoryResponseModel.fromJson(x))),
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_bn": nameBn,
        "slug": slug,
        "image": image,
        "create_date": createDate?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "subcategories": subcategories == null
            ? []
            : List<dynamic>.from(subcategories!.map((x) => x.toJson())),
        "categoryId": categoryId,
      };
}
