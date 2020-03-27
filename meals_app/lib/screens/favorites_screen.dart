import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeal;

  FavoritesScreen(this._favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeal.isEmpty) {
      return Center(
        child: Text("No Favorite Meals - Please add some!"),
      );
    } else {
      return ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(_favoriteMeal[index]);
          },
          itemCount: _favoriteMeal.length);
    }
  }
}
