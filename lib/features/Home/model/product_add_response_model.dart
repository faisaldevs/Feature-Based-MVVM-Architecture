import 'dart:convert';

class ProductAddResponseModel {
    bool? success;
    Adds? adds;

    ProductAddResponseModel({
        this.success,
        this.adds,
    });

    ProductAddResponseModel copyWith({
        bool? success,
        Adds? adds,
    }) => 
        ProductAddResponseModel(
            success: success ?? this.success,
            adds: adds ?? this.adds,
        );

    factory ProductAddResponseModel.fromRawJson(String str) => ProductAddResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductAddResponseModel.fromJson(Map<String, dynamic> json) => ProductAddResponseModel(
        success: json["success"],
        adds: json["adds"] == null ? null : Adds.fromJson(json["adds"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "adds": adds?.toJson(),
    };
}

class Adds {
    int? id;
    String? link;
    String? image;
    DateTime? createDate;
    DateTime? updatedAt;

    Adds({
        this.id,
        this.link,
        this.image,
        this.createDate,
        this.updatedAt,
    });

    Adds copyWith({
        int? id,
        String? link,
        String? image,
        DateTime? createDate,
        DateTime? updatedAt,
    }) => 
        Adds(
            id: id ?? this.id,
            link: link ?? this.link,
            image: image ?? this.image,
            createDate: createDate ?? this.createDate,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Adds.fromRawJson(String str) => Adds.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Adds.fromJson(Map<String, dynamic> json) => Adds(
        id: json["id"],
        link: json["link"],
        image: json["image"],
        createDate: json["create_date"] == null ? null : DateTime.parse(json["create_date"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "image": image,
        "create_date": createDate?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
