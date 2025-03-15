import 'dart:math';
import 'product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  List<Product> _allProducts = List.generate(
    25,
    (index) {
      return Product(
        id: "id_${index + 1}",
        title_product: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  ); // dibuat private dengan _ didepan nama variable

  List<Product> get allproducts {
    /**
     * ketika ingin akses products maka gunakan method ini.
     */
    return [..._allProducts];
  }

  Product findById(productId) {
    return _allProducts.firstWhere((prodId) => prodId.id == productId);
    /**
     * ambil semua product pada provider product lalu ambil data pertama dari id yang sama dengan id yg dikirim pada parameter
     */
  }

  // void addProduct() {
  //   _allProducts.add(value);
  //   notifyListeners(); // digunakan agar widget yang menggunakan products ini bisa mendapatkan pemberitahuan bahwa ada perubahaan data
  // }
}
