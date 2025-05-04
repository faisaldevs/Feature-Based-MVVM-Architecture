import 'dart:convert';

class CartCheckoutResponseModel {
    bool? success;
    int? code;
    Item? item;

    CartCheckoutResponseModel({
        this.success,
        this.code,
        this.item,
    });

    CartCheckoutResponseModel copyWith({
        bool? success,
        int? code,
        Item? item,
    }) => 
        CartCheckoutResponseModel(
            success: success ?? this.success,
            code: code ?? this.code,
            item: item ?? this.item,
        );

    factory CartCheckoutResponseModel.fromRawJson(String str) => CartCheckoutResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CartCheckoutResponseModel.fromJson(Map<String, dynamic> json) => CartCheckoutResponseModel(
        success: json["success"],
        code: json["code"],
        item: json["item"] == null ? null : Item.fromJson(json["item"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "item": item?.toJson(),
    };
}

class Item {
    int? id;
    int? userId;
    dynamic orderType;
    List<int>? productId;
    String? name;
    String? email;
    String? phone;
    String? country;
    String? zipCode;
    String? shippingDis;
    String? shippingSubDis;
    String? address;
    int? subTotalPrice;
    int? totalPrice;
    int? couponDiscount;
    int? paymentStatus;
    int? status;
    String? paymentMathod;
    dynamic productDetails;
    int? seen;
    DateTime? createDate;
    DateTime? updatedAt;

    Item({
        this.id,
        this.userId,
        this.orderType,
        this.productId,
        this.name,
        this.email,
        this.phone,
        this.country,
        this.zipCode,
        this.shippingDis,
        this.shippingSubDis,
        this.address,
        this.subTotalPrice,
        this.totalPrice,
        this.couponDiscount,
        this.paymentStatus,
        this.status,
        this.paymentMathod,
        this.productDetails,
        this.seen,
        this.createDate,
        this.updatedAt,
    });

    Item copyWith({
        int? id,
        int? userId,
        dynamic orderType,
        List<int>? productId,
        String? name,
        String? email,
        String? phone,
        String? country,
        String? zipCode,
        String? shippingDis,
        String? shippingSubDis,
        String? address,
        int? subTotalPrice,
        int? totalPrice,
        int? couponDiscount,
        int? paymentStatus,
        int? status,
        String? paymentMathod,
        dynamic productDetails,
        int? seen,
        DateTime? createDate,
        DateTime? updatedAt,
    }) => 
        Item(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            orderType: orderType ?? this.orderType,
            productId: productId ?? this.productId,
            name: name ?? this.name,
            email: email ?? this.email,
            phone: phone ?? this.phone,
            country: country ?? this.country,
            zipCode: zipCode ?? this.zipCode,
            shippingDis: shippingDis ?? this.shippingDis,
            shippingSubDis: shippingSubDis ?? this.shippingSubDis,
            address: address ?? this.address,
            subTotalPrice: subTotalPrice ?? this.subTotalPrice,
            totalPrice: totalPrice ?? this.totalPrice,
            couponDiscount: couponDiscount ?? this.couponDiscount,
            paymentStatus: paymentStatus ?? this.paymentStatus,
            status: status ?? this.status,
            paymentMathod: paymentMathod ?? this.paymentMathod,
            productDetails: productDetails ?? this.productDetails,
            seen: seen ?? this.seen,
            createDate: createDate ?? this.createDate,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        userId: json["user_id"],
        orderType: json["order_type"],
        productId: json["product_id"] == null ? [] : List<int>.from(json["product_id"]!.map((x) => x)),
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        country: json["country"],
        zipCode: json["zip_code"],
        shippingDis: json["shipping_dis"],
        shippingSubDis: json["shipping_subDis"],
        address: json["address"],
        subTotalPrice: json["sub_total_price"],
        totalPrice: json["total_price"],
        couponDiscount: json["coupon_discount"],
        paymentStatus: json["payment_status"],
        status: json["status"],
        paymentMathod: json["payment_mathod"],
        productDetails: json["product_details"],
        seen: json["seen"],
        createDate: json["create_date"] == null ? null : DateTime.parse(json["create_date"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "order_type": orderType,
        "product_id": productId == null ? [] : List<dynamic>.from(productId!.map((x) => x)),
        "name": name,
        "email": email,
        "phone": phone,
        "country": country,
        "zip_code": zipCode,
        "shipping_dis": shippingDis,
        "shipping_subDis": shippingSubDis,
        "address": address,
        "sub_total_price": subTotalPrice,
        "total_price": totalPrice,
        "coupon_discount": couponDiscount,
        "payment_status": paymentStatus,
        "status": status,
        "payment_mathod": paymentMathod,
        "product_details": productDetails,
        "seen": seen,
        "create_date": createDate?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
