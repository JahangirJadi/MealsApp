import 'package:flutter/material.dart';
import 'package:flutter_meal_app/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final String categoryId;
  final String title;
  final Color color;

  CategoryItem(
    this.categoryId,
    this.title,
    this.color,
  );

  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMeals.routeName, arguments: {
      'id': categoryId,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        )),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
