part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductGet extends ProductEvent {
  ProductGet();

  @override
  List<Object> get props => [];
}

class ProductGetSpefiCategory extends ProductEvent {
  final String category;
  ProductGetSpefiCategory({required this.category});

  @override
  List<Object> get props => [category];
}
