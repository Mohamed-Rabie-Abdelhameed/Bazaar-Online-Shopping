import 'package:flutter/material.dart';
import 'package:bazaar/Models/CartItem.dart';
import 'package:bazaar/Models/Product.dart';

class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];
  static int num = 0;

  List<CartItem> get list {
    return this._items;
  }

  int get Count {
    return this._items.length;
  }

  addToCart(Product prd) {
    var res = this._items.where((element) => element.prd.id == prd.id);
    if (res.isEmpty) {
      this
          ._items
          .add(CartItem(id: num++, prd: prd, qty: 1, sup_price: prd.price));
      notifyListeners();
    } else {
      res.first.qty++;
      res.first.sup_price += prd.price;
      notifyListeners();
    }
  }

  removeFromCart(CartItem item) {
    this._items.remove(item);
    notifyListeners();
  }
}
