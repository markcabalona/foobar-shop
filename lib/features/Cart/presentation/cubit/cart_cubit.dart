
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foobar_shop/features/Products/domain/entities/product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addToCart({
    required Product product,
  }) {
    emit(state.copyWith(products: [
      ...state.products,
      product,
    ]));
  }

  void removeFromCart({
    required Product product,
  }) {
    final products = state.products;

    products.removeWhere((element) => element == product);

    emit(state.copyWith(products: products));
  }
}
