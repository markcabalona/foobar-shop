// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<Product> products;

  const CartState({
    this.products = const [],
  });

  @override
  List<Object> get props => [
        products,
        DateTime.now(),
      ];

  CartState copyWith({
    List<Product>? products,
  }) {
    return CartState(
      products: products ?? this.products,
    );
  }
}
