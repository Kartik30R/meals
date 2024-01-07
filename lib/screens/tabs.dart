import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
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

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeal = [];
  Map<Filter, bool> _selectedFilter = kIntialFilter;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    final isExisting = _favouriteMeal.contains(meal);
    if (isExisting) {
      setState(() {
        _favouriteMeal.remove(meal);
      });
      _showInfoMessage('Meals is no longer favourite');
    } else {
      setState(() {
        _favouriteMeal.add(meal);
        _showInfoMessage('Marked as favourite');
      });
    }
  }

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
    final  availableMeals = dummyMeals.where((element) {
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
      ontoggleFavourite: (Meal meal) {
        _toggleMealFavouriteStatus(meal);
      }, AvailableMeals: availableMeals,
    );
    var activePageTitle = "categories";
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        title: null,
        meals: _favouriteMeal,
        ontoggleFavourite: (Meal meal) {
          _toggleMealFavouriteStatus(meal);
        },
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
