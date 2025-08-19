import 'package:flutter/material.dart';
// import 'package:meals/screen/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget{
  const FilterScreen({super.key});
  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen>{
  var _glutenFreefilterSet = false;
  var _lactoseFreefilterSet = false;
  var _vegentarianFreefilterSet = false;
  var _veganFreefilterSet = false;

  
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
    body: Column(
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
   );
  }
}