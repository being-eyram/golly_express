// To parse this JSON data, do
//
//     final catogories = catogoriesFromJson(jsonString);

import 'dart:convert';

Catogories catogoriesFromJson(String str) =>
    Catogories.fromJson(json.decode(str));

String catogoriesToJson(Catogories data) => json.encode(data.toJson());

class Catogories {
  final List<Datum> data;
  final String message;
  final String status;

  Catogories({
    required this.data,
    required this.message,
    required this.status,
  });

  factory Catogories.fromJson(Map<String, dynamic> json) => Catogories(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class Datum {
  final String uuid;
  final String name;
  final List<Item> items;

  Datum({
    required this.uuid,
    required this.name,
    required this.items,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        name: json["name"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  final String uuid;
  final String name;
  final int price;

  Item({
    required this.uuid,
    required this.name,
    required this.price,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        uuid: json["uuid"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "price": price,
      };
}
