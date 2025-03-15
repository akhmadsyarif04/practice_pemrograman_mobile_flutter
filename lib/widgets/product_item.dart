import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title_product;
  final String imageUrl;

  ProductItem(this.id, this.title_product, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    print(title_product);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: id,
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(Icons.favorite_border_outlined),
            color: Colors.amber,
            onPressed: () {},
          ),
          title: Text(
            title_product,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Colors.amber,
          ),
        ),
      ),
    );
  }
}
