part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

final class CategoriesFetch extends CategoriesEvent {
  const CategoriesFetch();
  @override
  List<Object> get props => [];
}
