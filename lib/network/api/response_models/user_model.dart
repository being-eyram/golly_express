// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final UserInfo data;
  final String message;
  final String status;

  UserModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: UserInfo.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
      };
}

class UserInfo {
  final String uuid;
  final String email;
  final String fullName;
  final String phoneNumber;
  final bool profileUpdated;
  final List<dynamic> shippingAddress;
  final List<dynamic> packages;
  final dynamic shipmentNotification;

  UserInfo({
    required this.uuid,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.profileUpdated,
    required this.shippingAddress,
    required this.packages,
    required this.shipmentNotification,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        uuid: json["uuid"],
        email: json["Email"],
        fullName: json["FullName"],
        phoneNumber: json["PhoneNumber"],
        profileUpdated: json["ProfileUpdated"],
        shippingAddress:
            List<dynamic>.from(json["ShippingAddress"].map((x) => x)),
        packages: List<dynamic>.from(json["Packages"].map((x) => x)),
        shipmentNotification: json["ShipmentNotification"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "Email": email,
        "FullName": fullName,
        "PhoneNumber": phoneNumber,
        "ProfileUpdated": profileUpdated,
        "ShippingAddress": List<dynamic>.from(shippingAddress.map((x) => x)),
        "Packages": List<dynamic>.from(packages.map((x) => x)),
        "ShipmentNotification": shipmentNotification,
      };
}
