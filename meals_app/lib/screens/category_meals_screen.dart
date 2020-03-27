import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  bool _isInit = false;
  Category category;
  List<Meal> categoryMeals;

  void _deleteMeal(String mealId) {
    print("delete $mealId");
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit == false) {
      final routeArgs =
          (ModalRoute.of(context).settings.arguments as Map<String, Object>);
      category = routeArgs["category"] as Category;
      categoryMeals = DUMMY_MEALS
          .where((meal) => meal.categories.contains(category.id))
          .toList();

      _isInit = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("build Meals");
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(categoryMeals[index], _deleteMeal);
          },
          itemCount: categoryMeals.length),
    );
  }
}
