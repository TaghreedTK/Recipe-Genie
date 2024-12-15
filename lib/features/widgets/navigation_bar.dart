import 'package:flutter/material.dart';
import 'package:food/features/screens/home_page/home_page..dart';
import 'package:food/features/screens/meal_plan_page/meal_plan_page.dart';
import 'package:food/features/screens/search_page/search_page.dart';
import 'package:food/features/screens/user_screen/user_screen.dart';
import 'package:food/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    HomePage(),
    MealPlanPage(),
    SearchPage(),
    ProfileScreen()
    // Add other pages here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.calendar, size: 30),
            label: 'Meal plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: 'User',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: TColors.secondry,
        unselectedItemColor: TColors.primary,
        backgroundColor: TColors.main,
        onTap: _onItemTapped,
      ),
    );
  }
}
