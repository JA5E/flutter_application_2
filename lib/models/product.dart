import 'package:meta/meta.dart';
import 'dart:convert';

class Product {
  bool available;
  String? description;
  String name;
  String? pic;
  double price;
  String? id;

  Product({
    required this.available,
    this.description,
    required this.name,
    this.pic,
    required this.price,
    this.id,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        available: json["available"],
        description: json["description"],
        name: json["name"],
        pic: json["pic"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "description": description,
        "name": name,
        "pic": pic,
        "price": price,
      };
}
