import 'package:bazaar/Models/CartItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bazaar/Models/Product.dart';
import 'package:bazaar/Providers/FavoriteProvider.dart';
import 'package:bazaar/Providers/CartProvider.dart';

class ProductItem extends StatelessWidget {
  Product product;
  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(product.title),
          trailing: Consumer<CartProvider>(builder: (context, value, child) {
            return IconButton(
              onPressed: () {
                value.addToCart(product);
              },
              icon: const Icon(Icons.shopping_basket),
            );
          }),
          subtitle: Text("\$${product.price.toString()}"),
        ),
        child: Container(
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(product.image),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Consumer<FavoriteProvider>(builder: (context, value, child) {
            return IconButton(
              onPressed: () {
                if (value.isFavorite(product))
                  value.removeFromFavorite(product);
                else
                  value.addToFavorite(product);
              },
              icon: Icon(
                  value.isFavorite(product)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red),
            );
          }),
        ),
      ),
    );
  }
}
