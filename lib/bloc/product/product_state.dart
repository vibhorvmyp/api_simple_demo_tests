part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  final List<ProductModel> productList;

  ProductLoaded(this.productList);
  @override
  List<Object> get props => [productList];
}

class ProductError extends ProductState {
  final String error;

  ProductError(this.error);
  @override
  List<Object> get props => [error];
}
