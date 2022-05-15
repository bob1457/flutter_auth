import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductsState with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'b1',
      title: 'The iPhone Photography Book',
      description: 'The',
      price: 22.99,
      imageUrl:
          'https://m.media-amazon.com/images/I/611hC25FNsL._AC_UY327_FMwebp_QL65_.jpg',
      isFavorable: true,
    ),
    Product(
      id: 'b2',
      title:
          'Creative food photography: How to capture exceptional images of food ',
      description: 'The',
      price: 43.99,
      imageUrl:
          'https://m.media-amazon.com/images/I/81U4cHXuJEL._AC_UY327_FMwebp_QL65_.jpg',
      isFavorable: true,
    ),
    Product(
        id: 'b3',
        title:
            'Generative AI with Python and TensorFlow 2: Create images, text, and music with VAEs, GANs, LSTMs, Transformer models',
        description: 'The',
        price: 37.99,
        imageUrl:
            'https://m.media-amazon.com/images/I/616B8zmk6ZL._AC_UY327_FMwebp_QL65_.jpg'),
    Product(
        id: 'b4',
        title: 'The Posing Playbook for Photographing Kids: ',
        description: 'The',
        price: 26.51,
        imageUrl:
            'https://m.media-amazon.com/images/I/61krrdmQreL._AC_UY327_FMwebp_QL65_.jpg'),
    Product(
      id: 'b5',
      title:
          'Digital Print, The: Preparing Images in Lightroom and Photoshop for Printing',
      description: 'The',
      price: 43.49,
      imageUrl:
          'https://m.media-amazon.com/images/I/41Qon5P5T0L._AC_UY327_FMwebp_QL65_.jpg',
      isFavorable: true,
    ),
    Product(
        id: 'b6',
        title: 'Image Objects: An Archaeology of Computer Graphics',
        description: 'The',
        price: 33.41,
        imageUrl:
            'https://m.media-amazon.com/images/I/61hvrxlvYNS._AC_UY327_QL65_.jpg'),
  ];

  // var _showFavoratesOnly = false; // this is for global(app wide) state management, if the state is only for a single widget, use statefull widget instead

  List<Product> get items {
    // if (_showFavoratesOnly) {
    //   return _items.where((item) => item.isFavorable == true).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((item) => item.isFavorable).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // showFavoratesOnly() {
  //   _showFavoratesOnly = true;
  //   notifyListeners();
  // }

  // showAll() {
  //   _showFavoratesOnly = false;
  //   notifyListeners();
  // }

}