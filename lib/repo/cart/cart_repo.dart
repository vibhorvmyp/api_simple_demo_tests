import 'dart:convert';
import 'package:api_simple_test_demo/models/cart/cart_model.dart';
import 'package:http/http.dart' as http;

class CartRepository {
  final http.Client httpClient;

  CartRepository({required this.httpClient});

  Future<List<CartModel>> getCartForUser(int userId) async {
    try {
      final response = await httpClient.get(
        Uri.parse('https://fakestoreapi.com/carts?userId=$userId'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => CartModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch cart: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch cart: $e');
    }
  }
}
