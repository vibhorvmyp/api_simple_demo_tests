import 'dart:convert';
import 'package:api_simple_test_demo/repo/cart/cart_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'helpers/test_helper.mocks.dart';

void main() {
  group('CartRepository', () {
    late CartRepository repository;
    late MockClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockClient();
      repository = CartRepository(httpClient: mockHttpClient);
    });

    test('fetches cart data successfully', () async {
      // Arrange
      final jsonResponse = jsonEncode([
        {
          "id": 1,
          "userId": 1,
          "date": "2020-03-02T00:00:00.000Z",
          "products": [
            {"productId": 1, "quantity": 4},
            {"productId": 2, "quantity": 1},
            {"productId": 3, "quantity": 6}
          ],
          "__v": 0
        },
        {
          "id": 2,
          "userId": 1,
          "date": "2020-01-02T00:00:00.000Z",
          "products": [
            {"productId": 2, "quantity": 4},
            {"productId": 1, "quantity": 10},
            {"productId": 5, "quantity": 2}
          ],
          "__v": 0
        }
      ]);

      when(mockHttpClient
              .get(Uri.parse('https://fakestoreapi.com/carts?userId=1')))
          .thenAnswer((_) async => http.Response(jsonResponse, 200));

      // Act
      final cartData = await repository.getCartForUser(1);

      // Assert
      expect(cartData.length, 2);
      expect(cartData[0].id, 1);
      expect(cartData[0].userId, 1);
      expect(cartData[0].date, DateTime.parse("2020-03-02T00:00:00.000Z"));
      expect(cartData[0].products.length, 3);
      expect(cartData[0].products[0].productId, 1);
      expect(cartData[0].products[0].quantity, 4);
    });

    test('throws exception when API request fails', () async {
      // Arrange
      when(mockHttpClient
              .get(Uri.parse('https://fakestoreapi.com/carts?userId=1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // Act & Assert
      expect(() async => await repository.getCartForUser(1), throwsException);
    });
  });
}
