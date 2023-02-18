// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:foobar_shop/core/errors/failures.dart';
import 'package:foobar_shop/core/mixins/repository_handler_mixins.dart';
import 'package:foobar_shop/features/Cart/data/datasources/remote_datasource.dart';
import 'package:foobar_shop/features/Cart/domain/entities/product.dart';
import 'package:foobar_shop/features/Cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl with RepositoryHandlerMixin implements CartRepository {
  final RemoteCartDataSource datasource;
  CartRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<CartFailure, List<Product>>> fetchProducts() {
    return this(
      request: () {
        return datasource.fetchProducts();
      },
      onFailure: (message) {
        return CartFailure(message: message ?? 'Something went wrong...');
      },
    );
  }
}
