import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorite_provider.dart';


class MealDetailScreen extends ConsumerWidget{
  const MealDetailScreen({super.key, required this.meal });
  final Meal meal;
  // final void Function(Meal meal) onToggleMealFavorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: 
               Text(meal.title),
        actions: [
          IconButton(
            onPressed: (){
                final wasAdded = ref.read(favoriteMealsProvider.notifier).toggelMealFavoriteStatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(wasAdded ? 'Meal added as a favorite.' : 'Meal removed')));
            },
             icon: Icon(isFavorite? Icons.star_outlined :Icons.star_outline)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
            meal.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
            ),
            const SizedBox(height: 14,),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14,),
            for(final ingredients in meal.ingredients)
               Text(
                ingredients,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            
            const SizedBox(height: 24,),
            Text(
              'step',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14,),
            for(final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              child: Text(
                step,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),  
          ],
        ),
      ),
    );
  }
}