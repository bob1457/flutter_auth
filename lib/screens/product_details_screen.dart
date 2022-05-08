import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_state.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;

    final loadedProduct = Provider.of<ProductsState>(context, listen: false)
        .findById(
            productId); // Disable the listening to change, not need changes here

    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title)),
      body: Container(
        child: Center(child: Text(loadedProduct.title + " Details")),
      ),
    );
  }
}
