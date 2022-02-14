import 'package:flutter/material.dart';
import 'package:flutter_auth/wodgets/meal_item.dart';
import '../data/category_data.dart';

class CategoryDetails extends StatelessWidget {
  // const CategoryDetails({Key? key}) : super(key: key);

  // final String categoryId;
  // final String categoryTitle;

  // CategoryDetails(this.categoryId, this.categoryTitle);
  static const routeName = "/category-details";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    final mealsInCategory = MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle != null ? categoryTitle : '')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: mealsInCategory[index].id,
              title: mealsInCategory[index].title,
              imgUrl: mealsInCategory[index].imageUrl,
              duration: mealsInCategory[index].duration,
              complexity: mealsInCategory[index].complexity,
              affordability: mealsInCategory[index].affordability);
        },
        itemCount: mealsInCategory.length,
      ),
    );
  }
}
