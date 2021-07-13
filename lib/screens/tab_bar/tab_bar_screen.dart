import 'package:flutter/material.dart';
import 'package:fresh_food/screens/cart/cart_screen.dart';
import 'package:fresh_food/screens/home_screen.dart';
import 'package:fresh_food/screens/recipes/recipes_screen.dart';
import 'package:fresh_food/screens/settings/settings_screen.dart';

class TabBarScreen extends StatefulWidget {
  static const String id = "tab";
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;
  changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color unselectedColor = Colors.grey;
  Color selectedColor = Colors.green;
  var items = [HomeScreen(), RecipesScreen(), CartScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.only(bottom: 10, left: 50, right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  changeIndex(0);
                },
                child: Icon(Icons.store_outlined,
                    color:
                        _selectedIndex == 0 ? selectedColor : unselectedColor),
              ),
              GestureDetector(
                onTap: () {
                  changeIndex(1);
                },
                child: Icon(Icons.receipt_outlined,
                    color:
                        _selectedIndex == 1 ? selectedColor : unselectedColor),
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: Color(0xff748A9D),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  changeIndex(2);
                },
                child: Icon(Icons.add_shopping_cart_outlined,
                    color:
                        _selectedIndex == 2 ? selectedColor : unselectedColor),
              ),
              GestureDetector(
                onTap: () {
                  changeIndex(3);
                },
                child: Icon(Icons.settings_outlined,
                    color:
                        _selectedIndex == 3 ? selectedColor : unselectedColor),
              ),
            ],
          ),
        ),
      ),
      body: items[_selectedIndex],
    );
  }
}
