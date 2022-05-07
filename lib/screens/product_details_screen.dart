import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/products_overview_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  // const ProdcutDetailsScrren({Key? key}) : super(key: key);

  // final String title;

  // ProductDetailsScreen(this.title);

  static const routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('title')),
      body: Container(
        child: Text(" Details"),
      ),
    );
  }
}
