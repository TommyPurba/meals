import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meals_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget{
  const MealsItem({super.key, required this.meal});

  final Meal meal;

  String get complexityChange{
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  } 

  String get affordabilityChange{
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }


  @override
  Widget build(BuildContext context) {
      return Card(
        margin: const EdgeInsets.all(8),
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
          onTap: (){} ,
          child: Stack(
            children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage), 
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Positioned(
                  bottom:0,
                  left: 0,
                  right: 50,
                  child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 44,
                    ),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,// very long text will ",,,"
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealsItemTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                            SizedBox(width: 10,),
                            MealsItemTrait(icon: Icons.work, label: complexityChange),
                            SizedBox(width: 10,),
                            MealsItemTrait(icon: Icons.work, label: affordabilityChange),
                          ],
                        ),
                      ],
                    ),

                    ),
                ),
            ],
          ),
        ),
      );
  }
}