import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/category.dart';
import 'package:meals/screen/meals.dart';

class TabsScreen extends StatefulWidget{
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {

    return _TabsScreenState();
  }

}

class _TabsScreenState extends State<TabsScreen>{
  int _selectedPageIdex = 0;
  final List<Meal> _favoriteMeals = [];

  void _toggleMealFavoriteStatus( Meal meal ){
    final isExisting = _favoriteMeals.contains(meal);

    if(isExisting){
      _favoriteMeals.remove(meal);
    }else{
      _favoriteMeals.add(meal);
    }
  }

  void selectedPage(int index){
    setState(() {
      _selectedPageIdex = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    Widget activeIndex = CategoryScreen(onToggleMealFavorite: _toggleMealFavoriteStatus,);
    var activepageScreen = "Category";

  //kondisi untuk ngececk page mana yang akan di tampilkan di appbar dan body
    if (_selectedPageIdex == 1){
      activeIndex = MealsScreen(meals: [], onToggleMealFavorite: _toggleMealFavoriteStatus,);
      activepageScreen = "Favorite";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activepageScreen),),
      body: activeIndex,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedPage,
        currentIndex: _selectedPageIdex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        ]
        ),
    );
  }

}