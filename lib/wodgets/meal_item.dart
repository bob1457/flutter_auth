import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.title,
    required this.imgUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  void selectedMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectedMeal,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imgUrl,
                      height: 200, width: double.infinity, fit: BoxFit.cover),
                )
              ],
            ),
          ])),
    );
  }
}
