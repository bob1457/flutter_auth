import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Product product =
    //     Provider.of<Product>(context); // Get all product items from th state
    return Consumer<Product>(
      builder: (BuildContext context, product, Widget? child) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailsScreen.routeName,
                arguments: product.id,
              );
            },
          ),
          footer: GridTileBar(
              title: Text(
                '\$' + product.price.toString(),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.black26,
              leading: IconButton(
                icon: Icon(product.isFavorable
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  product.toggleFavorateStatus();
                },
                color: Theme.of(context)
                    .colorScheme
                    .secondary, // use accentColor defined in the Theme in main.dart
              ),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
                color: Theme.of(context).colorScheme.secondary,
              )),
        ),
      ),
    );
  }
}
