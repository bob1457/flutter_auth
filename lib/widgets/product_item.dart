import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({Key? key}) : super(key: key);

  final String id;
  final String title;
  final String imageUrl;
  final double price;

  ProductItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
          title: Text(
            price.toString(),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black26,
          leading: IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          )),
    );
  }
}
