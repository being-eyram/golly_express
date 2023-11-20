// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final Data data;
  final String message;
  final String status;

  User({
    required this.data,
    required this.message,
    required this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  final String uuid;
  final String email;
  final String fullName;
  final String phoneNumber;
  final bool profileUpdated;
  final List<dynamic> shippingAddress;
  final List<dynamic> packages;
  final dynamic shipmentNotification;

  Data({
    required this.uuid,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.profileUpdated,
    required this.shippingAddress,
    required this.packages,
    required this.shipmentNotification,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
