import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
  final routeArgs = (ModalRoute.of(context).settings.arguments as Map<String, Object>);
  final category = routeArgs["category"] as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text("Test"),
      ),
    );
  }
}
