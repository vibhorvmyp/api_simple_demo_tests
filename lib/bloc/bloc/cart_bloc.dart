import 'package:api_simple_test_demo/bloc/bloc/cart_event.dart';
import 'package:api_simple_test_demo/bloc/bloc/cart_state.dart';
import 'package:api_simple_test_demo/repo/cart/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;

  CartBloc({required CartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(CartInitial()) {
    on<CartFetched>((event, emit) async {
      emit(CartLoading());
      try {
        final cartData = await _cartRepository.getCartForUser(event.userId);
        emit(CartSuccess(cartData: cartData));
      } catch (e) {
        emit(CartFailure(message: e.toString()));
      }
    });
  }
}
