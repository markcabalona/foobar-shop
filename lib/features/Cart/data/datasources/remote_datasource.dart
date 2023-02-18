import 'package:foobar_shop/features/Cart/data/models/product_model.dart';

abstract class RemoteCartDataSource {
  Future<List<ProductModel>> fetchProducts();
}
