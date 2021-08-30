import 'package:flutter/material.dart';
import 'package:flutter_meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filter'),
      ),
    );
  }
}
