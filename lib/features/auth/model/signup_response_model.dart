import 'dart:convert';

class SignupResponseModel {
    bool? success;
    int? code;
    String? message;
    String? token;
    User? user;

    SignupResponseModel({
        this.success,
        this.code,
        this.message,
        this.token,
        this.user,
    });

    SignupResponseModel copyWith({
        bool? success,
        int? code,
        String? message,
        String? token,
        User? user,
    }) => 
        SignupResponseModel(
            success: success ?? this.success,
            code: code ?? this.code,
            message: message ?? this.message,
            token: token ?? this.token,
            user: user ?? this.user,
        );

    factory SignupResponseModel.fromRawJson(String str) => SignupResponseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SignupResponseModel.fromJson(Map<String, dynamic> json) => SignupResponseModel(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "token": token,
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    String? userName;
    dynamic firstName;
    dynamic lastName;
    dynamic address;
    dynamic userEmail;
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

    User({
        this.id,
        this.userName,
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

    User copyWith({
        int? id,
        String? userName,
        dynamic firstName,
        dynamic lastName,
        dynamic address,
        dynamic userEmail,
        String? userPhone,
        int? userType,
        dynamic createDate,
        DateTime? updatedAt,
        dynamic userStatus,
        dynamic tokenCode,
        String? image,
        dynamic creator,
        dynamic created,
        dynamic zoneDivisions,
        dynamic zoneDistricts,
        dynamic zoneUpazilas,
    }) => 
        User(
            id: id ?? this.id,
            userName: userName ?? this.userName,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            address: address ?? this.address,
            userEmail: userEmail ?? this.userEmail,
            userPhone: userPhone ?? this.userPhone,
            userType: userType ?? this.userType,
            createDate: createDate ?? this.createDate,
            updatedAt: updatedAt ?? this.updatedAt,
            userStatus: userStatus ?? this.userStatus,
            tokenCode: tokenCode ?? this.tokenCode,
            image: image ?? this.image,
            creator: creator ?? this.creator,
            created: created ?? this.created,
            zoneDivisions: zoneDivisions ?? this.zoneDivisions,
            zoneDistricts: zoneDistricts ?? this.zoneDistricts,
            zoneUpazilas: zoneUpazilas ?? this.zoneUpazilas,
        );

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userName: json["userName"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        address: json["address"],
        userEmail: json["userEmail"],
        userPhone: json["userPhone"],
        userType: json["userType"],
        createDate: json["create_date"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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
