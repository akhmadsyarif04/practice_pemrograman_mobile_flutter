import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/badge.dart' as badges;
import '../widgets/product_grid.dart';

import '../screens/cart_screen.dart';

import '../providers/cart.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, ch) {
              return badges.Badge(
                  value: value.jumlah.toString(),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          CartScreen.routeName,
                        );
                      },
                      icon: Icon(Icons.shopping_cart)));
            },
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
