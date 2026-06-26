import 'package:flutter/material.dart';

import '../theme/tokens.dart';
import 'foods_screen.dart';
import 'guides_screen.dart';
import 'home_screen.dart';
import 'meals_screen.dart';
import 'search_screen.dart';

/// 5-tab bottom bar matching the original IA (§5):
/// Home · Foods · Guides · Meals · Search.
class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;

  final _screens = const [
    HomeScreen(),
    FoodsScreen(),
    GuidesScreen(),
    MealsScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _screens),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColors.hairline)),
        ),
        child: BottomNavigationBar(
          currentIndex: _index,
          onTap: (i) => setState(() => _index = i),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_outlined),
                activeIcon: Icon(Icons.restaurant),
                label: 'Foods'),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_outlined),
                activeIcon: Icon(Icons.menu_book),
                label: 'Guides'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lunch_dining_outlined),
                activeIcon: Icon(Icons.lunch_dining),
                label: 'Meals'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                activeIcon: Icon(Icons.search),
                label: 'Search'),
          ],
        ),
      ),
    );
  }
}
