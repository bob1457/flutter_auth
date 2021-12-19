import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  // const CategoryDetails({Key? key}) : super(key: key);

  final String categoryId;
  final String categoryTitel;

  CategoryDetails(this.categoryId, this.categoryTitel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitel)),
      body: Center(
        child: Container(
          child: Text(
            'Category Details',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
