import 'package:flutter/material.dart';
import 'package:bazaar/Models/CartItem.dart';
import 'package:bazaar/Models/Product.dart';

class FavoriteProvider with ChangeNotifier{
  List<CartItem> _items = [];
  static int num = 0;

  List<CartItem> get list {
    return this._items;
  }

  int get Count {
    return this._items.length;
  }

  addToFavorite(Product prd) {
    var res = this._items.where((element) => element.prd.id == prd.id);
    if (res.isEmpty) {
      this._items.add(CartItem(id: num++, prd: prd, qty: 1, sup_price: prd.price));
      notifyListeners();
    } 
  }

  removeFromFavorite(Product item) {
    var res = this._items.where((element) => element.prd.id == item.id);
    if (res.isNotEmpty){
      this._items.remove(res.first);
      notifyListeners();
    }
    notifyListeners();
  }

  isFavorite(Product product) {
    var res = this._items.where((element) => element.prd.id == product.id);
    return res.isNotEmpty;
  }
}