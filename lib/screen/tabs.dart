import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/category.dart';
import 'package:meals/screen/filter.dart';
import 'package:meals/screen/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

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

  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavoriteStatus( Meal meal ){
    final isExisting = _favoriteMeals.contains(meal);

    if(isExisting){
      setState(() {
         _favoriteMeals.remove(meal);
         _showInfoMessage("Meal is no longer a favorite");
      });
    }else{
     setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage("Marked as a favorite");
     });
    }
  }

  void selectedPage(int index){
    setState(() {
      _selectedPageIdex = index;
    });
  }

  void _selectpage(String identifier) async {
    Navigator.of(context).pop();
       if(identifier == "filter"){
    final result = await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
        builder: (ctx) => FilterScreen()
      ));

      print(result);
    }

    // ini fungsinya ketika di klik tombul back di bawa screen mobile akan langsung keluar dari aplikasi
    // if(identifier == "filter"){
    //   Navigator.of(context).pushReplacment(MaterialPageRoute(
    //     builder: (ctx) => FilterScreen()
    //   ));
    // }
  }
  @override
  Widget build(BuildContext context) {

    Widget activeIndex = CategoryScreen(onToggleMealFavorite: _toggleMealFavoriteStatus,);
    var activepageScreen = "Category";

  //kondisi untuk ngececk page mana yang akan di tampilkan di appbar dan body
    if (_selectedPageIdex == 1){
      activeIndex = MealsScreen(meals: _favoriteMeals, onToggleMealFavorite: _toggleMealFavoriteStatus,);
      activepageScreen = "Your Favorite";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activepageScreen),),
      drawer: MainDrawer(onSelectScreen: _selectpage,),
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