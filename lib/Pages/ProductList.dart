import 'package:flutter/material.dart';
import 'package:bazaar/Network/API.dart';
import 'package:bazaar/Models/Product.dart';
import 'package:bazaar/Widgets/ProductItem.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> _products = [];
  APICalls api = APICalls();

  @override
  void initState() {
    getData();
  }

  getData() async {
    List<Product> recieved = (await api.getPopularProducts()).cast<Product>();
    setState(() {
      this._products = recieved;
    });
    print(recieved);
  }

  @override
  Widget build(BuildContext context) {
    if (_products.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return GridView.builder(
        itemCount: _products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 0,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          return ProductItem(
            product: _products[index],
          );
        },
      );
    }
  }
}
