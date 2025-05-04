import 'dart:convert';

class SubCategoryItemResponseModel {
  List<Product>? products;
  int? total;
  List<Product>? totalsearchData;
  int? page;
  int? pageSize;

  SubCategoryItemResponseModel({
    this.products,
    this.total,
    this.totalsearchData,
    this.page,
    this.pageSize,
  });

  factory SubCategoryItemResponseModel.fromRawJson(String str) =>
      SubCategoryItemResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategoryItemResponseModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryItemResponseModel(
        products: json["products"] == null
            ? []
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
        total: json["total"],
        totalsearchData: json["totalsearchData"] == null
            ? []
            : List<Product>.from(
                json["totalsearchData"]!.map((x) => Product.fromJson(x))),
        page: json["page"],
        pageSize: json["pageSize"],
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "totalsearchData": totalsearchData == null
            ? []
            : List<dynamic>.from(totalsearchData!.map((x) => x.toJson())),
        "page": page,
        "pageSize": pageSize,
      };
}

class Product {
  int? id;
  String? name;
  String? nameBn;
  String? description;
  String? descriptionBn;
  int? currencyType;
  int? regularPrice;
  int? salePrice;
  int? couponDiscount;
  String? coupon;
  String? isbn;
  String? addition;
  int? quntity;
  String? activeStatus;
  String? category;
  String? subcategory;
  List<dynamic>? writer;
  String? account;
  List<dynamic>? writerName;
  String? brand;
  String? shop;
  String? newArrival;
  String? video;
  int? sellingRecord;
  String? slug;
  String? userType;
  int? userId;
  String? status;
  String? tags;
  String? metaTitle;
  String? metaDescription;
  String? image;
  List<String>? groupImage;
  DateTime? createDate;
  DateTime? updatedAt;
  Currency? currency;
  Userdata? userdata;

  Product({
    this.id,
    this.name,
    this.nameBn,
    this.description,
    this.descriptionBn,
    this.currencyType,
    this.regularPrice,
    this.salePrice,
    this.couponDiscount,
    this.coupon,
    this.isbn,
    this.addition,
    this.quntity,
    this.activeStatus,
    this.category,
    this.subcategory,
    this.writer,
    this.account,
    this.writerName,
    this.brand,
    this.shop,
    this.newArrival,
    this.video,
    this.sellingRecord,
    this.slug,
    this.userType,
    this.userId,
    this.status,
    this.tags,
    this.metaTitle,
    this.metaDescription,
    this.image,
    this.groupImage,
    this.createDate,
    this.updatedAt,
    this.currency,
    this.userdata,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        nameBn: json["name_bn"],
        description: json["description"],
        descriptionBn: json["description_bn"],
        currencyType: json["currency_type"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        couponDiscount: json["coupon_discount"],
        coupon: json["coupon"],
        isbn: json["isbn"],
        addition: json["addition"],
        quntity: json["quntity"],
        activeStatus: json["active_status"],
        category: json["category"],
        subcategory: json["subcategory"],
        writer: json["writer"] == null
            ? []
            : List<dynamic>.from(json["writer"]!.map((x) => x)),
        account: json["account"],
        writerName: json["writerName"] == null
            ? []
            : List<dynamic>.from(json["writerName"]!.map((x) => x)),
        brand: json["brand"],
        shop: json["shop"],
        newArrival: json["new_arrival"],
        video: json["video"],
        sellingRecord: json["selling_record"],
        slug: json["slug"],
        userType: json["userType"],
        userId: json["userId"],
        status: json["status"],
        tags: json["tags"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        image: json["image"],
        groupImage: json["group_image"] == null
            ? []
            : List<String>.from(json["group_image"]!.map((x) => x)),
        createDate: json["create_date"] == null
            ? null
            : DateTime.parse(json["create_date"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        currency: json["currency"] == null
            ? null
            : Currency.fromJson(json["currency"]),
        userdata: json["userdata"] == null
            ? null
            : Userdata.fromJson(json["userdata"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_bn": nameBn,
        "description": description,
        "description_bn": descriptionBn,
        "currency_type": currencyType,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "coupon_discount": couponDiscount,
        "coupon": coupon,
        "isbn": isbn,
        "addition": addition,
        "quntity": quntity,
        "active_status": activeStatus,
        "category": category,
        "subcategory": subcategory,
        "writer":
            writer == null ? [] : List<dynamic>.from(writer!.map((x) => x)),
        "account": account,
        "writerName": writerName == null
            ? []
            : List<dynamic>.from(writerName!.map((x) => x)),
        "brand": brand,
        "shop": shop,
        "new_arrival": newArrival,
        "video": video,
        "selling_record": sellingRecord,
        "slug": slug,
        "userType": userType,
        "userId": userId,
        "status": status,
        "tags": tags,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "image": image,
        "group_image": groupImage == null
            ? []
            : List<dynamic>.from(groupImage!.map((x) => x)),
        "create_date": createDate?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "currency": currency?.toJson(),
        "userdata": userdata?.toJson(),
      };
}

class Currency {
  int? id;
  String? currencyName;
  int? currencyValue;
  DateTime? createDate;
  DateTime? updatedAt;

  Currency({
    this.id,
    this.currencyName,
    this.currencyValue,
    this.createDate,
    this.updatedAt,
  });

  factory Currency.fromRawJson(String str) =>
      Currency.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        currencyName: json["currency_name"],
        currencyValue: json["currency_value"],
        createDate: json["create_date"] == null
            ? null
            : DateTime.parse(json["create_date"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "currency_name": currencyName,
        "currency_value": currencyValue,
        "create_date": createDate?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Userdata {
  int? id;
  String? userName;
  String? userPass;
  dynamic firstName;
  dynamic lastName;
  dynamic address;
  String? userEmail;
  String? userPhone;
  int? userType;
  dynamic createDate;
  DateTime? updatedAt;
  dynamic userStatus;
  dynamic tokenCode;
  String? image;
  dynamic creator;
  dynamic created;
  dynamic zoneDivisions;
  dynamic zoneDistricts;
  dynamic zoneUpazilas;

  Userdata({
    this.id,
    this.userName,
    this.userPass,
    this.firstName,
    this.lastName,
    this.address,
    this.userEmail,
    this.userPhone,
    this.userType,
    this.createDate,
    this.updatedAt,
    this.userStatus,
    this.tokenCode,
    this.image,
    this.creator,
    this.created,
    this.zoneDivisions,
    this.zoneDistricts,
    this.zoneUpazilas,
  });

  factory Userdata.fromRawJson(String str) =>
      Userdata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        id: json["id"],
        userName: json["userName"],
        userPass: json["userPass"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        address: json["address"],
        userEmail: json["userEmail"],
        userPhone: json["userPhone"],
        userType: json["userType"],
        createDate: json["create_date"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        userStatus: json["userStatus"],
        tokenCode: json["tokenCode"],
        image: json["image"],
        creator: json["creator"],
        created: json["created"],
        zoneDivisions: json["zone_divisions"],
        zoneDistricts: json["zone_districts"],
        zoneUpazilas: json["zone_upazilas"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "userPass": userPass,
        "firstName": firstName,
        "lastName": lastName,
        "address": address,
        "userEmail": userEmail,
        "userPhone": userPhone,
        "userType": userType,
        "create_date": createDate,
        "updatedAt": updatedAt?.toIso8601String(),
        "userStatus": userStatus,
        "tokenCode": tokenCode,
        "image": image,
        "creator": creator,
        "created": created,
        "zone_divisions": zoneDivisions,
        "zone_districts": zoneDistricts,
        "zone_upazilas": zoneUpazilas,
      };
}
