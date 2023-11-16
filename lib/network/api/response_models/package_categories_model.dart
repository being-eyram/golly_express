// To parse this JSON data, do
//
//     final packageCategories = packageCategoriesFromJson(jsonString);

import 'dart:convert';

PackageCategories packageCategoriesFromJson(String str) =>
    PackageCategories.fromJson(json.decode(str));

String packageCategoriesToJson(PackageCategories data) =>
    json.encode(data.toJson());

class PackageCategories {
  final List<Category> data;
  final String message;
  final String status;

  PackageCategories({
    required this.data,
    required this.message,
    required this.status,
  });

  factory PackageCategories.fromJson(Map<String, dynamic> json) =>
      PackageCategories(
        data:
            List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status": status,
      };
}

class Category {
  final String uuid;
  final String name;
  final List<Item> items;

  Category({
    required this.uuid,
    required this.name,
    required this.items,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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
