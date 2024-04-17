import 'dart:convert';
import 'package:api_simple_test_demo/models/categories/categories_model.dart';
import 'package:http/http.dart' as http;

class CategoriesRepository {
  final http.Client httpClient;

  CategoriesRepository({required this.httpClient});

  final String endpoint = "https://fakestoreapi.com/products/categories";

  Future<List<Categories>> getCategories() async {
    try {
      final response = await httpClient.get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body) as List<dynamic>;
        final categories = result
            .cast<String>()
            .map((category) => Categories.fromString(category))
            .toList();
        return categories;
      } else {
        throw Exception('Failed to fetch categories: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }
}
