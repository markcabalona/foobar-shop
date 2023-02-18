import 'package:foobar_shop/features/Products/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imaegPath,
    required super.price,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      imaegPath,
      price,
    ];
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      imaegPath: map['imaeg_path'] as String,
      price: map['price'] as double,
    );
  }
}
