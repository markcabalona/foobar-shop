import 'package:dartz/dartz.dart';
import 'package:foobar_shop/core/errors/failures.dart';
import 'package:foobar_shop/features/Products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<ProductFailure, List<Product>>> fetchProducts();
}
