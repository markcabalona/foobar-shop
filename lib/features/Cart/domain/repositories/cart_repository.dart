import 'package:dartz/dartz.dart';
import 'package:foobar_shop/core/errors/failures.dart';
import 'package:foobar_shop/features/Cart/domain/entities/product.dart';

abstract class CartRepository {
  Future<Either<CartFailure, List<Product>>> fetchProducts();
}
