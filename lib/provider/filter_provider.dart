import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/meals_providers.dart';

enum Filter {
  glutenfree,lactosefree,vegetarian,vegan
 }

class FilterNotifier extends StateNotifier<Map<Filter,bool>>{
  FilterNotifier()  : super({
    Filter.glutenfree:false,
    Filter.lactosefree:false,
    Filter.vegetarian:false,
    Filter.vegan:false,
  });

  void setFilters(Map<Filter,bool> chosenFilters){
    state=chosenFilters;
  }
  void setFilter (Filter filter ,bool isActive){
    state ={
      ...state,
      filter:isActive,
    };
  }
}




final filterProvider = StateNotifierProvider<FilterNotifier ,Map<Filter,bool>>((ref)=>FilterNotifier());

final filteredMealsProvider = Provider((ref)


 { 
  final meals= ref.watch(mealsProvider);
 final activeFilter =ref.watch(filterProvider);
  return meals.where((element) {
 
      if (activeFilter[Filter.glutenfree]! && !element.isGlutenFree) {
        return false;
      }
      if (activeFilter[Filter.glutenfree]! && !element.isGlutenFree) {
        return false;
      }
      if (activeFilter[Filter.glutenfree]! && !element.isGlutenFree) {
        return false;
      }
      if (activeFilter[Filter.glutenfree]! && !element.isGlutenFree) {
        return false;
      }
      return true;
    }).toList();}

 
);