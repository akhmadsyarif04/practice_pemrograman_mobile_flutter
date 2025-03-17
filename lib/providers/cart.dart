import '../models/cart_item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  double get totalHarga {
    double total = 0;
    _items.forEach((key, cartItem) {
      total += (cartItem.qty ?? 0) * (cartItem.price ?? 0) as double;
    });
    return total.toDouble();
  }

  int get jumlah {
    return _items.length;
  }

  void addCart(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      // ketika sudah tersedia key product id
      _items.update(
        productId,
        (value) => CartItem(
            id: value.id,
            title: value.title,
            price: value.price,
            qty: value.qty! + 1),
      );
    } else {
      // nambah product id baru
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(), title: title, price: price, qty: 1),
      );
    }
    notifyListeners();
  }
}
