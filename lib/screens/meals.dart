import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals_details.dart';
import 'package:meals/widgets/meal_Item.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key,required this.title,required this.meals});

  final String title;
  final List<Meal> meals;



void selectedMeal(BuildContext context,Meal meal) {

    Navigator.push(
        context,
        MaterialPageRoute(

            builder: (ctx) =>
               MealDetails(meal: meal)));
  }


  @override
  Widget build(BuildContext context) {
    Widget content=ListView.builder(itemBuilder: (ctx,index)=>Text(
      meals[index].title,
    ));

    if(meals.isEmpty){
      content = Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text('Uh oh ... nothing here!' , style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),  ),
          const SizedBox( height: 16,),
          Text('Try Selecting a different category' ,style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),)

        ],),
      );
    }
  return Scaffold(
    appBar: AppBar(
      title: Text(title),
    ),
    body: ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx,index)=>MealItem(meal: meals[index], selectmeal: (){selectedMeal( context, meals[index]);})),
  );
  }}