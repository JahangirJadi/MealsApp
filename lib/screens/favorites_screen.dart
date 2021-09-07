import 'package:flutter/material.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';
import '/widgets/main_drawer.dart';

class Favorites extends StatelessWidget {

  final List<Meal> favorites;


  Favorites(this.favorites);

  @override
  Widget build(BuildContext context) {

    if(favorites.isEmpty){
      return Center(
        child: Text(
          "you don't have any favorites yet.",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          final meals = favorites[index];

          return MealItem(
            mealId: meals.id,
            title: meals.title,
            imageUrl: meals.imageUrl,
            duration: meals.duration,
            complexity: meals.complexity,
            affordability: meals.affordability,

          );
        },
        itemCount: favorites.length,
      );
    }


  }
}
