import 'package:api_simple_test_demo/models/product/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductModel', () {
    test('fromJson() parses JSON correctly', () {
      // Arrange
      final json = {
        "id": 1,
        "title": "Product 1",
        "price": 10.99,
        "description": "This is product 1",
        "category": "men's clothing",
        "image": "https://example.com/image1.jpg",
        "rating": {"rate": 4.5, "count": 100}
      };

      // Act
      final productModel = ProductModel.fromJson(json);

      // Assert
      expect(productModel.id, 1);
      expect(productModel.title, 'Product 1');
      expect(productModel.price, 10.99);
      expect(productModel.description, 'This is product 1');
      expect(productModel.category, Category.MEN_S_CLOTHING);
      expect(productModel.image, 'https://example.com/image1.jpg');
      expect(productModel.rating!.rate, 4.5);
      expect(productModel.rating!.count, 100);
    });

    test('toJson() encodes object correctly', () {
      // Arrange
      final productModel = ProductModel(
        id: 1,
        title: 'Product 1',
        price: 10.99,
        description: 'This is product 1',
        category: Category.MEN_S_CLOTHING,
        image: 'https://example.com/image1.jpg',
        rating: Rating(rate: 4.5, count: 100),
      );

      // Act
      final json = productModel.toJson();

      // Assert
      expect(json['id'], 1);
      expect(json['title'], 'Product 1');
      expect(json['price'], 10.99);
      expect(json['description'], 'This is product 1');
      expect(json['category'], 'men\'s clothing');
      expect(json['image'], 'https://example.com/image1.jpg');
      expect(json['rating'], {'rate': 4.5, 'count': 100});
    });
  });
}
