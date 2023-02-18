// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:foobar_shop/core/errors/failures.dart';
import 'package:foobar_shop/core/mixins/repository_handler_mixins.dart';
import 'package:foobar_shop/features/Products/data/datasources/products_datasource.dart';
import 'package:foobar_shop/features/Products/domain/entities/product.dart';
import 'package:foobar_shop/features/Products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl
    with RepositoryHandlerMixin
    implements ProductRepository {

  final RemoteProductDataSource datasource;
  ProductRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<ProductFailure, List<Product>>> fetchProducts() {
    return this(
      request: () {
        return datasource.fetchProducts();
      },
      onFailure: (message) {
        return ProductFailure(message: message ?? 'Something went wrong...');
      },
    );
  }
}
