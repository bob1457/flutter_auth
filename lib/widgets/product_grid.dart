import 'package:flutter/material.dart';
import 'package:flutter_auth/widgets/product_item.dart';
import 'package:provider/provider.dart';

import '../providers/products_state.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoratesOnly;

  ProductGrid(this.showFavoratesOnly);

  @override
  Widget build(BuildContext context) {
    // final bool showFavorates;

    final productData = Provider.of<ProductsState>(
        context); // Listen to the changes to the product state, the list of all products in this case
    final products =
        showFavoratesOnly ? productData.favoriteItems : productData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        // create: (BuildContext context) => products[index],
        value: products[index],
        child: ProductItem(
            // id: products[index].id,
            // title: products[index].title,
            // imageUrl: products[index].imageUrl,
            // price: products[index].price,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
