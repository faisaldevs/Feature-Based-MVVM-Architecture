import 'dart:convert';

class SliderModelResponse {
    int? id;
    String? title;
    String? text;
    String? slug;
    String? image;
    String? status;
    DateTime? createDate;
    DateTime? updatedAt;

    SliderModelResponse({
        this.id,
        this.title,
        this.text,
        this.slug,
        this.image,
        this.status,
        this.createDate,
        this.updatedAt,
    });

    factory SliderModelResponse.fromRawJson(String str) => SliderModelResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SliderModelResponse.fromJson(Map<String, dynamic> json) => SliderModelResponse(
        id: json["id"],
        title: json["title"],
        text: json["text"],
        slug: json["slug"],
        image: json["image"],
        status: json["status"],
        createDate: json["create_date"] == null ? null : DateTime.parse(json["create_date"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "text": text,
        "slug": slug,
        "image": image,
        "status": status,
        "create_date": createDate?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
