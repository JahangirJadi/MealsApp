

import 'package:flutter/material.dart';
import 'package:flutter_meal_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';
  final Function saveFilters;


  FilterScreen(this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    String subTitle,
    bool state,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: state,
      subtitle: Text(subTitle),
      onChanged:
        updateValue
      ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final selectedFilters = {
            'gluten': _glutenFree,
            'lactose': _lactoseFree,
            'vegan': _vegan,
            'vegetarian': _vegetarian,
          };
          widget.saveFilters(selectedFilters);
        },
        child: Icon(Icons.save),
      ),
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                'Gluten-free',
                'Only include gluten-free meals.',
                _glutenFree,
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegetarian',
                'Only include vegetarian meals.',
                _vegetarian,
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Vegan',
                'Only include vegan meals.',
                _vegan,
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              _buildSwitchListTile(
                'Lactose-free',
                'Only include lactose-free meals.',
                _lactoseFree,
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
