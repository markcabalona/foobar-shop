import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foobar_shop/core/enums/state_status.dart';
import 'package:foobar_shop/features/Products/data/datasources/firebase_remote_datasource.dart';
import 'package:foobar_shop/features/Products/data/repositories/product_repository_impl.dart';
import 'package:foobar_shop/features/Products/domain/entities/product.dart';
import 'package:foobar_shop/features/Products/domain/repositories/product_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  late final ProductRepository repository;
  ProductsCubit() : super(const ProductsState()) {
    repository =
        ProductRepositoryImpl(datasource: RemoteProductDataSourceImpl());
  }

  void fetchProducts() async {
    emit(state.copyWith(
      status: StateStatus.loading,
    ));

    final result = await repository.fetchProducts();
    result.fold(
      (failure) {
        emit(state.copyWith(
          status: StateStatus.error,
          errorMessage: failure.message,
        ));
      },
      (products) {
        emit(state.copyWith(
          status: StateStatus.loaded,
          products: products,
        ));
      },
    );
  }
}
