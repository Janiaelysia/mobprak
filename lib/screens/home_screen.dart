import 'package:activewell_new/pages/account.dart';
import 'package:activewell_new/pages/favorite.dart';
import 'package:activewell_new/pages/home.dart';
import 'package:activewell_new/pages/tools.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Creating static data in lists

  static List<Widget> pages = [
    HomePage(),
    ToolsPage(),
    FavoritePage(),
    AccountPage(),
  ];
  int _currentIndex = 0;

  void onItemTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTap,
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        iconSize: 32,
        selectedItemColor: Color.fromARGB(255, 237, 86, 59),
        selectedFontSize: 18,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_sharp), label: 'Tools'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
