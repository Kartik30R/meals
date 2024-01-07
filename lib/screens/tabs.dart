import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/favorites_provider.dart';

import 'package:meals/provider/meals_providers.dart';
import 'package:meals/screens/Filter.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/main_drawer.dart';
import 'package:meals/screens/meals.dart';

const kIntialFilter = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  Map<Filter, bool> _selectedFilter = kIntialFilter;

  



  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String indentifier) async {
    Navigator.pop(context);
    if (indentifier == 'filter') {
      final result = await Navigator.push<Map<Filter, bool>>(
          context, MaterialPageRoute(builder: (ctx) => FilterScreen(currentFilters:_selectedFilter)));

      setState(() {
        _selectedFilter = result ?? kIntialFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
final meals = ref.watch(mealsProvider);

    final  availableMeals = meals.where((element) {
      if (_selectedFilter[Filter.glutenfree]! && !element.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filter.glutenfree]! && !element.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filter.glutenfree]! && !element.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filter.glutenfree]! && !element.isGlutenFree) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
    AvailableMeals: availableMeals,
    );
    var activePageTitle = "categories";
    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        title: null,
        meals: favoriteMeals,
        
      );
      activePageTitle = 'Your favourite';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourite')
          ]),
    );
  }
}
