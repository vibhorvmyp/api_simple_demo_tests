import 'package:api_simple_test_demo/models/categories/categories_model.dart';
import 'package:api_simple_test_demo/repo/categories/categories_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository _categoriesRepository;
  CategoriesBloc({required CategoriesRepository categoriesRepository})
      : _categoriesRepository = categoriesRepository,
        super(CategoriesInitial()) {
    on<CategoriesEvent>((event, emit) {});
    on<CategoriesFetch>((event, emit) async {
      emit(CategoriesLoading());

      try {
        final data = await _categoriesRepository.getCategories();

        print("DATA: $data");
        emit(CategoriesSuccess(categories: data));
      } catch (e) {
        CategoriesFailure(message: e.toString());
      }
    });
  }
}
