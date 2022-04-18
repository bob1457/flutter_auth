import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/widgets/product_item.dart';

import '../models/product_model.dart';

class ProductOverviewScreen extends StatelessWidget {
  // const ProductOverviewScreen({Key? key}) : super(key: key);

  final List<Product> loadedProducts = [
    Product(
        id: 'b1',
        title: 'The iPhone Photography Book',
        price: 22.99,
        imageUrl:
            'https://m.media-amazon.com/images/I/611hC25FNsL._AC_UY327_FMwebp_QL65_.jpg'),
    Product(
        id: 'b2',
        title:
            'Creative food photography: How to capture exceptional images of food ',
        price: 43.99,
        imageUrl:
            'https://m.media-amazon.com/images/I/81U4cHXuJEL._AC_UY327_FMwebp_QL65_.jpg'),
    Product(
        id: 'b3',
        title:
            'Generative AI with Python and TensorFlow 2: Create images, text, and music with VAEs, GANs, LSTMs, Transformer models',
        price: 37.99,
        imageUrl:
            'https://m.media-amazon.com/images/I/616B8zmk6ZL._AC_UY327_FMwebp_QL65_.jpg'),
    Product(
        id: 'b4',
        title: 'The Posing Playbook for Photographing Kids: ',
        price: 26.51,
        imageUrl:
            'https://m.media-amazon.com/images/I/61krrdmQreL._AC_UY327_FMwebp_QL65_.jpg'),
    Product(
        id: 'b5',
        title:
            'Digital Print, The: Preparing Images in Lightroom and Photoshop for Printing',
        price: 43.49,
        imageUrl:
            'https://m.media-amazon.com/images/I/41Qon5P5T0L._AC_UY327_FMwebp_QL65_.jpg'),
    Product(
        id: 'b6',
        title: 'Image Objects: An Archaeology of Computer Graphics',
        price: 33.41,
        imageUrl:
            'https://m.media-amazon.com/images/I/61hvrxlvYNS._AC_UY327_QL65_.jpg'),
  ];

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
            price: loadedProducts[index].price,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ));
  }
}