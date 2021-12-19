import 'package:flutter/material.dart';
import 'package:flutter_auth/data/category_data.dart';
import 'package:flutter_auth/screens/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meal Fonder')),
      body: GridView(
        padding: const EdgeInsets.all(15),
        children: CATEGORIES
            .map((category) => CategoryItem(
                  category.title,
                  category.color,
                  category.id,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
