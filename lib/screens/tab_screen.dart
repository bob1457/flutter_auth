import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/category_screen.dart';

import '../models/meal.dart';
import '../wodgets/main_drawer.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  // TabsScreen({Key? key}) : super(key: key);
  List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> _pages = [];

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Favorates',
      },
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        // leading: _pages[_selectedPageIndex]['title'] == 'Categories'
        //     ? Icon(Icons.category)
        //     : Icon(Icons.star),

        // bottom: TabBar(
        //   tabs: [
        //     Tab(
        //       icon: Icon(
        //         Icons.category,
        //         color: Colors.amber,
        //       ),
        //       text: 'Categories',
        //     ),
        //     Tab(
        //       icon: Icon(
        //         Icons.star,
        //         color: Colors.red,
        //       ),
        //       text: 'Favorates',
        //     ),
        //   ],
        // ),
      ),
      drawer: MainDrawer(),
      // body: TabBarView(
      //   children: [CategoryScreen(), FavoritesScreen()],
      // ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Colors.purple, //Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                // color: Colors.amber,
              ),
              label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                // color: Colors.purple,
              ),
              label: "Favorites"),
        ],
      ),
    );
  }
}
