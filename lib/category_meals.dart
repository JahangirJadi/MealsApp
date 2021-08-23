import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {
  const CategoryMeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Recipes'),
      ),
      body: Center(
        child: Text('The recipes for the category'),
      ),
    );
  }
}
