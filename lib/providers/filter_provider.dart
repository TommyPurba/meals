import 'package:flutter_riverpod/flutter_riverpod.dart';


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