// To parse this JSON data, do
//
//     final userotplogin = userotploginFromJson(jsonString);

import 'dart:convert';

Userotplogin userotploginFromJson(String str) => Userotplogin.fromJson(json.decode(str));

String userotploginToJson(Userotplogin data) => json.encode(data.toJson());

class Userotplogin {
    Userotplogin({
        this.status,
        this.data,
    });

    String? status;
    Data? data;

    factory Userotplogin.fromJson(Map<String, dynamic> json) => Userotplogin(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.dob,
        this.firstName,
        this.lastName,
        this.paymentMode,
        this.userType,
        this.email,
        this.gender,
        this.countryCode,
        this.mobile,
        this.password,
        this.picture,
        this.deviceToken,
        this.deviceId,
        this.deviceType,
        this.loginBy,
        this.socialUniqueId,
        this.latitude,
        this.longitude,
        this.stripeCustId,
        this.walletBalance,
        this.rating,
        this.otp,
        this.language,
        this.qrcodeUrl,
        this.referralUniqueId,
        this.referalCount,
        this.rememberToken,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? dob;
    String? firstName;
    String? lastName;
    String? paymentMode;
    String? userType;
    String? email;
    String? gender;
    String? countryCode;
    String? mobile;
    String? password;
    String? picture;
    dynamic deviceToken;
    dynamic deviceId;
    String? deviceType;
    String? loginBy;
    dynamic socialUniqueId;
    dynamic latitude;
    dynamic longitude;
    dynamic stripeCustId;
    int? walletBalance;
    String? rating;
    int? otp;
    dynamic language;
    String? qrcodeUrl;
    dynamic referralUniqueId;
    int? referalCount;
    dynamic rememberToken;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        dob: json["dob"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        paymentMode: json["payment_mode"],
        userType: json["user_type"],
        email: json["email"],
        gender: json["gender"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        password: json["password"],
        picture: json["picture"],
        deviceToken: json["device_token"],
        deviceId: json["device_id"],
        deviceType: json["device_type"],
        loginBy: json["login_by"],
        socialUniqueId: json["social_unique_id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        stripeCustId: json["stripe_cust_id"],
        walletBalance: json["wallet_balance"],
        rating: json["rating"],
        otp: json["otp"],
        language: json["language"],
        qrcodeUrl: json["qrcode_url"],
        referralUniqueId: json["referral_unique_id"],
        referalCount: json["referal_count"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "dob":dob,
        "first_name": firstName,
        "last_name": lastName,
        "payment_mode": paymentMode,
        "user_type": userType,
        "email": email,
        "gender": gender,
        "country_code": countryCode,
        "mobile": mobile,
        "password": password,
        "picture": picture,
        "device_token": deviceToken,
        "device_id": deviceId,
        "device_type": deviceType,
        "login_by": loginBy,
        "social_unique_id": socialUniqueId,
        "latitude": latitude,
        "longitude": longitude,
        "stripe_cust_id": stripeCustId,
        "wallet_balance": walletBalance,
        "rating": rating,
        "otp": otp,
        "language": language,
        "qrcode_url": qrcodeUrl,
        "referral_unique_id": referralUniqueId,
        "referal_count": referalCount,
        "remember_token": rememberToken,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
