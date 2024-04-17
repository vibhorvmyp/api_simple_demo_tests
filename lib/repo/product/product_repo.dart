import 'dart:convert';
import 'package:api_simple_test_demo/models/product/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  final http.Client httpClient;

  ProductRepository({required this.httpClient});

  String endpoint = 'https://fakestoreapi.com/products';
  String endpointForCategory = 'https://fakestoreapi.com/category/';

  Future<List<ProductModel>> getProducts() async {
    final response = await httpClient.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<ProductModel>> getProductsForSpecificCategory(
      {required String category}) async {
    final response =
        await httpClient.get(Uri.parse('$endpointForCategory$category'));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
