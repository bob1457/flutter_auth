import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/widgets/product_item.dart';

import '../models/product_model.dart';

class ProductOverviewScreen extends StatelessWidget {
  // const ProductOverviewScreen({Key? key}) : super(key: key);

  final List<Product> loadedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('We...Buy'),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: loadedProducts.length,
          itemBuilder: (context, index) => ProductItem(
            id: loadedProducts[index].id,
            title: loadedProducts[index].title,
            imageUrl: loadedProducts[index].imageUrl,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ));
  }
}
