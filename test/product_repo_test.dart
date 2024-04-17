import 'dart:convert';
import 'package:api_simple_test_demo/repo/product/product_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'helpers/test_helper.mocks.dart';

void main() {
  group('ProductRepository', () {
    late ProductRepository repository;
    late MockClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockClient();
      repository = ProductRepository(httpClient: mockHttpClient);
    });

    test('fetches products successfully', () async {
      // Arrange
      final jsonResponse = jsonEncode([
        {
          "id": 1,
          "title": "Product 1",
          "price": 10.99,
          "description": "This is product 1",
          "category": null,
          "image": "https://example.com/image1.jpg",
          "rating": {"rate": 4.5, "count": 100}
        },
        {
          "id": 2,
          "title": "Product 2",
          "price": 15.99,
          "description": "This is product 2",
          "category": null,
          "image": "https://example.com/image2.jpg",
          "rating": {"rate": 3.8, "count": 50}
        },
      ]);

      when(mockHttpClient.get(Uri.parse('https://fakestoreapi.com/products')))
          .thenAnswer((_) async => http.Response(jsonResponse, 200));

      // Act
      final products = await repository.getProducts();

      // Assert
      expect(products.length, 2);
      expect(products[0].id, 1);
      expect(products[0].title, 'Product 1');
      expect(products[0].price, 10.99);
      expect(products[0].description, 'This is product 1');
      expect(products[0].category, null);
      expect(products[0].image, 'https://example.com/image1.jpg');
      expect(products[0].rating!.rate, 4.5);
      expect(products[0].rating!.count, 100);
    });

    test('throws exception when API request fails', () {
      // Arrange
      when(mockHttpClient.get(Uri.parse('https://fakestoreapi.com/products')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // Act & Assert
      expect(() async => await repository.getProducts(), throwsException);
    });

    test('fetches products based on specific category successfully', () async {
      // Arrange
      final jsonResponse = jsonEncode([
        {
          "id": 1,
          "title": "Product 1",
          "price": 10.99,
          "description": "This is product 1",
          "category": null,
          "image": "https://example.com/image1.jpg",
          "rating": {"rate": 4.5, "count": 100}
        },
        {
          "id": 2,
          "title": "Product 2",
          "price": 15.99,
          "description": "This is product 2",
          "category": null,
          "image": "https://example.com/image2.jpg",
          "rating": {"rate": 3.8, "count": 50}
        },
      ]);

      when(mockHttpClient
              .get(Uri.parse('https://fakestoreapi.com/category/jewelery')))
          .thenAnswer((_) async => http.Response(jsonResponse, 200));

      // Act
      final products =
          await repository.getProductsForSpecificCategory(category: 'jewelery');

      // Assert
      expect(products.length, 2);
      expect(products[0].id, 1);
      expect(products[0].title, 'Product 1');
      expect(products[0].price, 10.99);
      expect(products[0].description, 'This is product 1');
      expect(products[0].category, null);
      expect(products[0].image, 'https://example.com/image1.jpg');
      expect(products[0].rating!.rate, 4.5);
      expect(products[0].rating!.count, 100);
    });

    test(
        'throws exception when products for specific category API request fails',
        () {
      // Arrange
      when(mockHttpClient
              .get(Uri.parse('https://fakestoreapi.com/category/jewelery')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // Act & Assert
      expect(
          () async => await repository.getProductsForSpecificCategory(
              category: 'jewelery'),
          throwsException);
    });
  });
}
