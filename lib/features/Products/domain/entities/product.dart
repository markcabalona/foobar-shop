// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imagePath;
  final double price;
  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      imagePath,
      price,
    ];
  }
}
