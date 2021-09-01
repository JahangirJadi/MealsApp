import 'package:flutter/material.dart';
import 'package:flutter_meal_app/dummy_data.dart';
import 'package:flutter_meal_app/models/meal.dart';
import 'package:flutter_meal_app/screens/category_meals.dart';
import 'package:flutter_meal_app/screens/filter_screen.dart';
import 'package:flutter_meal_app/screens/meal_detail_screen.dart';
import 'package:flutter_meal_app/screens/tab_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Meal> _availableMeals = DUMMY_MEALS;


  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
if(_filters['gluten'] as bool && !meal.isGlutenFree){
  return false;
}
if(_filters['lactose'] as bool && !meal.isLactoseFree){
  return false;
}
if(_filters['vegan'] as bool && !meal.isVegan){
  return false;
}
if(_filters['vegetarian'] as bool && !meal.isVegetarian){
  return false;
}
return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilters),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
    );
  }
}
