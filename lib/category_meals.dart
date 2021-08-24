import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {

  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;
  //
  //
  // CategoryMeals(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'] as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text('The recipes for the category'),
      ),
    );
  }
}
