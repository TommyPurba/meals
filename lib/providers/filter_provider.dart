import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meal_provider.dart';


enum Filter {
  gluttenFree,
  lactoseFree,
  vegentarian,
  vegan,
}
class FilterNotifier extends StateNotifier<Map<Filter, bool>>{
  FilterNotifier():super({
    Filter.gluttenFree : false,
    Filter.lactoseFree : false,
    Filter.vegentarian : false,
    Filter.vegan : false,
  });

  void setFilters(Map<Filter, bool> choosenActive){
    state = choosenActive;
  }

  void setFilter(Filter filter, bool isActive){
    state = {
      ...state,
      filter: isActive
    };
  }
}

final filtersProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
  (ref){
    return FilterNotifier();
  }
);


final filteredMealsProvider = Provider((ref){
    final meal = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filtersProvider);
  return meal.where(
      (meal) {
        if(activeFilters[Filter.gluttenFree]! && !meal.isGlutenFree){
            return false;
        }
         if(activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
            return false;
        }
         if(activeFilters[Filter.vegentarian]! && !meal.isVegetarian){
            return false;
        }
         if(activeFilters[Filter.vegan]! && !meal.isVegan){
            return false;
        }
        return true;
      }
    ).toList();
});