part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {
  @override
  List<Object> get props => [];
}

final class CategoriesLoading extends CategoriesState {
  @override
  List<Object> get props => [];
}

final class CategoriesSuccess extends CategoriesState {
  final List<Categories> categories;

  const CategoriesSuccess({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class CategoriesFailure extends CategoriesState {
  final String message;

  const CategoriesFailure({required this.message});

  @override
  List<Object> get props => [message];
}
