import 'package:api_simple_test_demo/models/product/product_model.dart';
import 'package:api_simple_test_demo/repo/product/product_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc(this.productRepository) : super(ProductLoading()) {
    on<ProductEvent>((event, emit) {});

    on<ProductGet>(
      (event, emit) async {
        emit(ProductLoading());
        // await Future.delayed(const Duration(seconds: 1));
        try {
          final data = await productRepository.getProducts();
          emit(ProductLoaded(data));
        } catch (e) {
          emit(ProductError(e.toString()));
        }
      },
    );

    on<ProductGetSpefiCategory>(
      (event, emit) async {
        emit(ProductLoading());
        // await Future.delayed(const Duration(seconds: 1));
        try {
          final data = await productRepository.getProductsForSpecificCategory(
              category: event.category);
          emit(ProductLoaded(data));
        } catch (e) {
          emit(ProductError(e.toString()));
        }
      },
    );
  }
}
