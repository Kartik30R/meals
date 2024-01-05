import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(meal.imageUrl)))),
          ),
          SizedBox(height: 16,),
           Text('Ingredients' ,style:Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          )),
          SizedBox(height: 8,),
          for(final ingredients in meal.ingredients)
            Text(ingredients
          , style:Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,))

        ],
      ),
    );
  }
}
