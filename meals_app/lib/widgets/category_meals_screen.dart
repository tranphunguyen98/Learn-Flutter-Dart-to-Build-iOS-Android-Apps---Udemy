import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data/dummy_data.dart';
import 'package:meals_app/models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        (ModalRoute.of(context).settings.arguments as Map<String, Object>);
    final category = routeArgs["category"] as Category;

    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Text(categoryMeals[index].title);
          },
          itemCount: categoryMeals.length),
    );
  }
}
