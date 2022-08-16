import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryTitle;
  final String categoryId;

  CategoryMealsScreen(this.categoryTitle, this.categoryId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(
          'The Recipes For The Category!',
        ),
      ),
    );
  }
}
