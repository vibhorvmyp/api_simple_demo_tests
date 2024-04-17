import 'package:api_simple_test_demo/models/cart/cart_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final List<CartModel> cartData;

  const CartSuccess({required this.cartData});

  @override
  List<Object> get props => [cartData];
}

class CartFailure extends CartState {
  final String message;

  const CartFailure({required this.message});

  @override
  List<Object> get props => [message];
}
