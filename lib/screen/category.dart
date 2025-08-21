
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

    _animationController.forward();
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
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ), 

      //cara terakhir dan paling optimize 
      builder: (context, child) => SlideTransition(
        position:  Tween(
            begin: Offset(0, 0.3),
            end: Offset(0, 0),
          ).animate(
            CurvedAnimation(
              parent: _animationController, 
              curve: Curves.easeInOut,
            )
          ), 
      child: child,
      ),
      // cara kedua
      // builder: (context, child) => SlideTransition(
      //   position: _animationController.drive(
      //     Tween(
      //       begin: Offset(0, 0.3),
      //       end: Offset(0, 0),
      //     )
      //   ), 
      // child: child,
      // ),

      // ini dipakai untuk animasi juga tapi ada beberapa cara animasi (ini cara pertama)
      // builder: (context, child) =>Padding(padding: EdgeInsets.only(
      //     top: 100 - _animationController.value * 100
      // ),
      // child: child,
      // )
    );
  }
}