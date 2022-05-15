import 'package:flutter/material.dart';

import '../widgets/product_grid.dart';

enum FilterOption { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  // const ProductOverviewScreen({Key? key}) : super(key: key);
  bool _showFavoratesOnly =
      false; // this will be passed to productGrid for filtering (global variable in this widget)

  @override
  Widget build(BuildContext context) {
    // final productContainer = Provider.of<ProductsState>(context, listen: false); // use local state by staefull widget
    //insteaf of Provider which is for app wide atate emanagement

    return Scaffold(
      appBar: AppBar(
        title: Text('We...Buy'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              setState(() {
                if (selectedValue == FilterOption.Favorites) {
                  // productContainer.showFavoratesOnly();
                  _showFavoratesOnly = true;
                } else {
                  // productContainer.showAll();
                  _showFavoratesOnly = false;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text('Only Favorates'), value: FilterOption.Favorites),
              PopupMenuItem(child: Text('Show All'), value: FilterOption.All),
            ],
          ),
        ],
      ),
      body: ProductGrid(_showFavoratesOnly),
    );
  }
}
