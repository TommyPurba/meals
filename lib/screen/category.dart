
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoryScreen extends StatefulWidget{
  const CategoryScreen({super.key,  required this.availAbleMeals});
  // tidak dipakai lagi karena sudah pakai statemanagen river
  // const CategoryScreen({super.key, required this.onToggleMealFavorite, required this.availAbleMeals});

  final List<Meal> availAbleMeals;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with SingleTickerProviderStateMixin{
   
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory (BuildContext context, Category category){
    final filteredMeals = widget.availAbleMeals.where(
      (meal)=> meal.categories.contains(category.id)
    ).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx)=> MealsScreen(
          title: category.title, 
          meals: filteredMeals
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