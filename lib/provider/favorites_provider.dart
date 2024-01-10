import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';


class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavoriteMealsNotifier() : super([]);

bool toggleMealFavouriteStatus(Meal meal){
  // Check if the meal is already a favorite
  final mealIsFavorite = state.contains(meal);
  
  // If the meal is already a favorite, remove it
  if(mealIsFavorite){
    // Update the state by creating a new list without the meal to be removed
    state = state.where((element) => element.id != meal.id).toList();
    return false; // Indicate that the meal is no longer a favorite
  } else {
    // If the meal is not a favorite, add it to the list
    state = [...state, meal]; // Update the state by creating a new list with the added meal
    return true; // Indicate that the meal is now a favorite
  }
}
}


final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});