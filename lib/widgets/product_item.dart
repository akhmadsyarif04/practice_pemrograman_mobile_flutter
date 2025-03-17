import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Image.network(
            productData.imageUrl.toString(),
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
              builder: (context, productData, child) => IconButton(
                    icon: (productData.isFavorite)
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border_outlined),
                    color: Colors.amber,
                    onPressed: () {
                      productData.statusFavorite();
                    },
                  )),
          title: Text(
            productData.title_product.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Berhasil ditambahkan"),
                duration: Duration(milliseconds: 500),
              ));
              cart.addCart(
                  productData.id.toString(),
                  productData.title_product.toString(),
                  productData.price!.toDouble());
            },
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
