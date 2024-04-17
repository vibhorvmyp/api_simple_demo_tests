import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartFetched extends CartEvent {
  final int userId;

  const CartFetched(this.userId);

  @override
  List<Object> get props => [userId];
}
