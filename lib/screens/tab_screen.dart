import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/category_screen.dart';

import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    CategoryScreen(),
    FavoritesScreen(),
  ];

  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals'),
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
      // body: TabBarView(
      //   children: [CategoryScreen(), FavoritesScreen()],
      // ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "CategoryCategories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites"),
        ],
      ),
    );
  }
}
