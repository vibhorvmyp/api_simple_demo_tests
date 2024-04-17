import 'package:api_simple_test_demo/bloc/product/product_bloc.dart';
import 'package:api_simple_test_demo/models/product/product_model.dart';
import 'package:api_simple_test_demo/views/category_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockProductBloc extends Mock implements ProductBloc {}

void main() {
  group('ProductScreen', () {
    late MockProductBloc mockProductBloc;

    setUp(() {
      mockProductBloc = MockProductBloc();
    });

    testWidgets(
        'renders CircularProgressIndicator when state is ProductLoading',
        (WidgetTester tester) async {
      // Arrange
      when(mockProductBloc.state).thenReturn(ProductLoading());

      // Act
      await tester.pumpWidget(
        BlocProvider.value(
          value: mockProductBloc,
          child: const MaterialApp(
            home: ProductScreen(),
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'renders ListView with ProductModel items when state is ProductLoaded',
        (WidgetTester tester) async {
      // Arrange
      final products = [
        ProductModel(
          id: 1,
          title: 'Product 1',
          price: 10.99,
          description: 'This is product 1',
          category: null,
          image: 'https://example.com/image1.jpg',
          rating: Rating(rate: 4.5, count: 100),
        ),
        ProductModel(
          id: 2,
          title: 'Product 2',
          price: 15.99,
          description: 'This is product 2',
          category: null,
          image: 'https://example.com/image2.jpg',
          rating: Rating(rate: 3.8, count: 50),
        ),
      ];

      when(mockProductBloc.state).thenReturn(ProductLoaded(products));

      // Act
      await tester.pumpWidget(
        BlocProvider.value(
          value: mockProductBloc,
          child: const MaterialApp(
            home: ProductScreen(),
          ),
        ),
      );

      // Assert
      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Product 1'), findsOneWidget);
      expect(find.text('Product 2'), findsOneWidget);
    });
  });
}
