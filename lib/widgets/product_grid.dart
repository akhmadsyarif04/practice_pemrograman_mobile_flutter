import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/all_products.dart';

import '../providers/product.dart';
import '../widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData =
        Provider.of<Products>(context); // memanggil provider product

    final all_product = productData
        .allproducts; // getter provider product dipanggil untuk mendapatkan data

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: all_product.length,
      itemBuilder: (ctx, i) {
        return ChangeNotifierProvider.value(
          value: all_product[i],
          // create: (context) => all_product[i],
          child: ProductItem(),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
