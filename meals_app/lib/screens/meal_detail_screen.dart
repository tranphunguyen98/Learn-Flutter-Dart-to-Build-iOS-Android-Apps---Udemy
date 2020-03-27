import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  const MealDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Container(
        child: Center(
          child: Text("Detail!"),
        ),
      ),
    );
  }
}
