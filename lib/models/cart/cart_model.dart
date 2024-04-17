// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartModel {
  final int id;
  final int userId;
  final DateTime date;
  final List<ProductInCart> products;

  CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      products: List<ProductInCart>.from(
        json['products'].map(
          (product) => ProductInCart.fromJson(product),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date.toIso8601String(),
      'products': products.map((product) => product.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'CartModel(id: $id, userId: $userId, date: $date, products: $products)';
  }
}

class ProductInCart {
  final int productId;
  final int quantity;

  ProductInCart({
    required this.productId,
    required this.quantity,
  });

  factory ProductInCart.fromJson(Map<String, dynamic> json) {
    return ProductInCart(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}
