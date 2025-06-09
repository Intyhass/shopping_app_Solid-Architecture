import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app_solid_architecture/data/models/product_model.dart';

class ProductApiService {
  Future<List<ProductModel>> fetchProducts() async {
    //return [ProductModel(id: 1, title: 'Test Product', price: 9.99)];
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );

    if (response.statusCode == 200) {
      final List products = json.decode(response.body)['products'];
      return products.map((product) => ProductModel.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
