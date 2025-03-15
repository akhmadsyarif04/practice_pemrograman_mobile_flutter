import 'package:flutter/foundation.dart';

class Product {
  final String? id;
  final String? title_product;
  final String? description;
  final double? price;
  final String? imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title_product,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });
}
