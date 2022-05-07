import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../widgets/product_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  // const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('We...Buy'),
      ),
      body: ProductGrid(),
    );
  }
}
