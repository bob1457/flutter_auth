import 'package:flutter/cupertino.dart';

import '../models/meal.dart';
import '../wodgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  // const FavoritesScreen({Key? key}) : super(key: key);
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You do not have any favorited'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imgUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability);
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
