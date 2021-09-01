import 'package:flutter/material.dart';
import 'package:flutter_meal_app/dummy_data.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMeals(this.availableMeals);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  @override
  late String categoryTitle;
  late List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'] as String;
    final categoryId = routeArgs['id'] as String;
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final meals = displayedMeals[index];

          return MealItem(
            mealId: meals.id,
            title: meals.title,
            imageUrl: meals.imageUrl,
            duration: meals.duration,
            complexity: meals.complexity,
            affordability: meals.affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
