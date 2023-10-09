import 'package:meta/meta.dart';
import 'dart:convert';

class Product {
    Map<String, ProductValue> products;

    Product({
        required this.products,
    });

    factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        products: Map.from(json["products"]).map((k, v) => MapEntry<String, ProductValue>(k, ProductValue.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "products": Map.from(products).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class ProductValue {
    bool available;
    String description;
    String name;
    String pic;
    int price;

    ProductValue({
        required this.available,
        required this.description,
        required this.name,
        required this.pic,
        required this.price,
    });

    factory ProductValue.fromRawJson(String str) => ProductValue.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProductValue.fromJson(Map<String, dynamic> json) => ProductValue(
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
