import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/all_products.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart' as badges;
import '../screens/cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!

    final product = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
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
      body: Column(children: [
        Container(
          width: double.infinity,
          height: 250,
          child: Image.network(
            "${product.imageUrl}",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 30),
        Text(
          "${product.title_product}",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "\$${product.price}",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "${product.description}",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        OutlinedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Berhasil ditambahkan"),
                duration: Duration(milliseconds: 500),
              ));
              cart.addCart(product.id.toString(),
                  product.title_product.toString(), product.price!.toDouble());
            },
            child: Text(
              'Add to cart',
              style: TextStyle(fontSize: 24),
            ))
      ]),
    );
  }
}
