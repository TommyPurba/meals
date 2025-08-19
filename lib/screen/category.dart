
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget{
  const CategoryScreen({super.key, required this.onToggleMealFavorite, required this.availAbleMeals});

  final List<Meal> availAbleMeals;
  final void Function(Meal meal) onToggleMealFavorite;

  void _selectCategory (BuildContext context, Category category){
    final filteredMeals = availAbleMeals.where(
      (meal)=> meal.categories.contains(category.id)
    ).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx)=> MealsScreen(
          title: category.title, 
          meals: filteredMeals,
          onToggleMealFavorite: onToggleMealFavorite,
          )
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(24),
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for(final category in availableCategories)
          CategoryGridItem(category: category, selectCategory: () {
            _selectCategory(context, category);
          },)
        ],
      );
  }
}