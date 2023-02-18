import 'package:foobar_shop/features/Products/data/models/product_model.dart';

abstract class RemoteProductDataSource {
  Future<List<ProductModel>> fetchProducts();
}
