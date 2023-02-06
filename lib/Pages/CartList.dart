import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bazaar/Providers/CartProvider.dart';
import 'package:bazaar/Models/CartItem.dart';

class CartList extends StatelessWidget {
  List<CartItem> list = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, value, child) {
      if (value.list == null || value.list.isEmpty ) {
        return const Center(
          child: Text('No Items in Cart'),
        );
      }
      return ListView.builder(
          itemCount: value.list.length,
          itemBuilder: (context, index) => Dismissible(
              key: ValueKey(value.list[index].id),
              onDismissed: (direction) {
                value.removeFromCart(value.list[index]);
              },
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(value.list[index].prd.image),
                  ),
                  title: Text(value.list[index].prd.title),
                  subtitle: Text(value.list[index].sup_price.toString()),
                  trailing: Text(value.list[index].qty.toString()))));
    });
  }
}
