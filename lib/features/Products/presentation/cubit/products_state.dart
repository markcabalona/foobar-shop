// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'products_cubit.dart';

class ProductsState extends Equatable {
  final StateStatus status;
  final String? errorMessage;
  final List<Product> products;
  const ProductsState({
    this.status = StateStatus.initial,
    this.errorMessage,
    this.products = const [],
  });

  @override
  List<Object> get props => [
        status,
        products,
        if (errorMessage != null) errorMessage!,
      ];

  ProductsState copyWith({
    StateStatus? status,
    String? errorMessage,
    List<Product>? products,
  }) {
    return ProductsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      products: products ?? this.products,
    );
  }
}
