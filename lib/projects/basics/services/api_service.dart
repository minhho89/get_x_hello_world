import 'dart:convert';

import 'package:get_x_ripples_code_tut/projects/basics/models/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'));
    if (response.statusCode == 200) {
      final jsonString = response.body;
      var list = jsonDecode(jsonString) as List;

      List<Product> products = list.map((e) => Product.fromJson(e)).toList();
      return products;
    } else {
      throw Exception('Error parsing json');
    }
  }
}
