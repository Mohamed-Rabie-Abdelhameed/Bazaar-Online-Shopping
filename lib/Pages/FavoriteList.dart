import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bazaar/Providers/FavoriteProvider.dart';
import 'package:bazaar/Models/CartItem.dart';

class FavoriteList extends StatelessWidget {
  List<CartItem> list = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>(builder: (context, value, child) {
      if (value.list.isEmpty) {
        return const Center(
          child: Text('No Items in Favorite List'),
        );
      }
      return ListView.builder(
          itemCount: value.list.length,
          itemBuilder: (context, index) => Dismissible(
              key: ValueKey(value.list[index].id),
              onDismissed: (direction) {
                value.removeFromFavorite(value.list[index].prd);
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
