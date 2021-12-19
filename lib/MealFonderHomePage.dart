import 'package:flutter/material.dart';

class MealFonderHomePage extends StatelessWidget {
  const MealFonderHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          child: Text('HOME',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 64,
              )),
        ),
      ),
    );
  }
}
