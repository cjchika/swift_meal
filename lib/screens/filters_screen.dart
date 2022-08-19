import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;

  FiltersScreen(this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _filterAdjustBuilder(
    String title,
    bool currentValue,
    String description,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'glutten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.filter),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _filterAdjustBuilder('Glutten-free', _glutenFree,
                    'Only include Glutten-free meals', (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                }),
                _filterAdjustBuilder('Lactose-free', _lactoseFree,
                    'Only include Lactose-free meals', (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                }),
                _filterAdjustBuilder(
                    'Vegan', _vegan, 'Only include Vegan meals', (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                }),
                _filterAdjustBuilder(
                    'Vegetarian', _vegetarian, 'Only include vegetarian meals',
                    (newValue) {
                  setState(
                    () {
                      _vegetarian = newValue;
                    },
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
