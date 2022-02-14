import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/category_details.dart';

import '../screens/category_details.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({Key? key}) : super(key: key);
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.title, this.color, this.id);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryDetails.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
    // MaterialPageRoute(
    //   builder: (context) {
    //     return CategoryDetails(id, title);
    //   },
    // ),
    // );
  }

  @override
  Widget build(BuildContext ctx) {
    return InkWell(
      onTap: () => selectCategory(ctx),
      // onTap: () => {
      //   Navigator.of(ctx).push(
      //     MaterialPageRoute(
      //       builder: (ctx) {
      //         return CategoryDetails();
      //       },
      //     ),
      //   )
      // },
      splashColor: Theme.of(ctx).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title, style: Theme.of(ctx).textTheme.subtitle1),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
