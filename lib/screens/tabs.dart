import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeal = [];

  void _showInfoMessage (String message){
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

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      ontoggleFavourite: (Meal meal) {
        _toggleMealFavouriteStatus(meal);
      },
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
      appBar: AppBar(title: Text(activePageTitle)),
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
