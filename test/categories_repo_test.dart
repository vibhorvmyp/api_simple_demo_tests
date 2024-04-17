import 'dart:convert';
import 'package:api_simple_test_demo/repo/categories/categories_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'helpers/test_helper.mocks.dart';
import 'package:http/http.dart' as http;

void main() {
  group('CategoryRepository', () {
    late CategoriesRepository categoryRepository;
    late MockClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockClient();
      categoryRepository = CategoriesRepository(httpClient: mockHttpClient);
    });

    test('Fetch categories successfully', () async {
      //Arrange
      final jsonResponse =
          jsonEncode(['mabgo', 'banana', 'orange', 'pineapple']);

      when(mockHttpClient
              .get(Uri.parse('https://fakestoreapi.com/products/categories')))
          .thenAnswer((_) async => http.Response(jsonResponse, 200));

      //Act
      final categories = await categoryRepository.getCategories();

      //Assert
      expect(categories.length, 4);
      expect(categories[1].title, 'banana');
    });

    test('throws exception when API request fails', () {
      // Arrange
      when(mockHttpClient
              .get(Uri.parse('https://fakestoreapi.com/products/categories')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // Act & Assert
      expect(() async => await categoryRepository.getCategories(),
          throwsException);
    });
  });
}
