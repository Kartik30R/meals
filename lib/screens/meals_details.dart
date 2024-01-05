import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal, required this.ontoggleFavourite});

  final Meal meal;
  final void Function(Meal meal ) ontoggleFavourite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){ontoggleFavourite(meal);}, icon: Icon(Icons.star))],
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            
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
              const SizedBox(height: 24,),
               Text('Ingredients' ,style:Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              )),
              const SizedBox(height: 8,),
              for(final ingredients in meal.ingredients)
                Text(ingredients
              , style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,)),
                  Text('Steps' ,style:Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
              )),
              const SizedBox(height: 8,),
              for(final steps in meal.steps)
                Text(steps
              , style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,))
          
            
            ],
          ),
        ),
      ),
    );
  }
}
