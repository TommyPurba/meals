  import 'package:flutter/material.dart';
  import 'package:flutter_riverpod/flutter_riverpod.dart';
  import 'package:meals/providers/filter_provider.dart';
  // import 'package:meals/screen/tabs.dart';
  // import 'package:meals/widgets/main_drawer.dart';


  class FilterScreen extends ConsumerStatefulWidget{
    const FilterScreen({super.key, });
    // final Map<Filter, bool> currentFilters;

    @override
    ConsumerState<FilterScreen> createState() {
      return _FilterScreenState();
    }
  }

  class _FilterScreenState extends ConsumerState<FilterScreen>{
    var _glutenFreefilterSet = false;
    var _lactoseFreefilterSet = false;
    var _vegentarianFreefilterSet = false;
    var _veganFreefilterSet = false;

    @override
    void initState() {
      super.initState();
      final activeFilters = ref.read(filtersProvider);
      _glutenFreefilterSet = activeFilters[Filter.gluttenFree]!;
      _lactoseFreefilterSet = activeFilters[Filter.lactoseFree]!;
      _veganFreefilterSet = activeFilters[Filter.vegan]!;
      _vegentarianFreefilterSet = activeFilters[Filter.vegentarian]!;
    }
    
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters',),
      ),
      // DRAWER DIPAKAI APBILA DI MENGGUNAKAN BACK DI ATAS SCALFOLD
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier){
      //     Navigator.of(context).pop();
      //     if(identifier == "meals"){
      //       Navigator.of(context).pushReplacement(MaterialPageRoute(
      //         builder: (ctx) => TabsScreen()
      //       )
      //       );
      //     }
      // },
      // ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didpop, dynamic result){
          if(didpop)return;
          ref.read(filtersProvider.notifier).setFilters({
            Filter.gluttenFree: _glutenFreefilterSet,
            Filter.lactoseFree: _lactoseFreefilterSet,
            Filter.vegentarian: _vegentarianFreefilterSet,
            Filter.vegan:_veganFreefilterSet,
          });
          Navigator.of(context).pop();
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreefilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _glutenFreefilterSet = isChecked;
                });
              },
              title: Text(
                "Glutten-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                "Only include gluten-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreefilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _lactoseFreefilterSet = isChecked;
                });
              },
              title: Text(
                "Lactose-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                "Only include lactose-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegentarianFreefilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _vegentarianFreefilterSet = isChecked;
                });
              },
              title: Text(
                "Vegentarian-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                "Only include vegentarian-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFreefilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _veganFreefilterSet = isChecked;
                });
              },
              title: Text(
                "Vegan-free",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              subtitle: Text(
                "Only include vegan-free meals",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ),
      ),
    );
    }
  }