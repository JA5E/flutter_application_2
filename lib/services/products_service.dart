import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier {
  final String _baseUrl = "https://moviles2-jase-default-rtdb.firebaseio.com/";
  final List<Product> products = [];

  bool isLoading = true;

  ProductsService() {
    this.loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    this.isLoading = true;

    notifyListeners();
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final product = Product.fromJson(value);
      product.id = key;

      this.products.add(product);
    });

    this.isLoading = false;
    notifyListeners();

    return products;
  }
}
