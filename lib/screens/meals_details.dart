// ignore_for_file: subtype_of_sealed_class

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/provider/favorites_provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({
    super.key,
    required this.meal,
  }) ;

  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavourite = favoriteMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final wasAdded=ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavouriteStatus(meal);
                     ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(wasAdded ? 'Meal Added' : 'meal removed')),
    );
              },
              icon: Icon(isFavourite? Icons.star  : Icons.star_border))
        ],
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
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(meal.imageUrl)))),
              ),
              const SizedBox(
                height: 24,
              ),
              Text('Ingredients',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 8,
              ),
              for (final ingredients in meal.ingredients)
                Text(ingredients,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        )),
              Text('Steps',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 8,
              ),
              for (final steps in meal.steps)
                Text(steps,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ))
            ],
          ),
        ),
      ),
    );
  }
}
