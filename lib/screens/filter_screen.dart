import 'package:flutter/material.dart';

import '../wodgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  // const FilterScreen({Key? key}) : super(key: key);
  static const routeName = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text('Filtered'),
      ),
      drawer: MainDrawer(),
    );
  }
}
