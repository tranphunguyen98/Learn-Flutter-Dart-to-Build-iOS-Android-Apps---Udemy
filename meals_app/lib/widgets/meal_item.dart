import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function deleteMeal;

  MealItem(this.meal,this.deleteMeal);

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: meal,
    ).then((mealId) {
      if(mealId != null) {
       deleteMeal(mealId);
      }
    });
  }

  Widget _buildRowInformationItem(IconData icon, String text) {
    return Row(
      children: <Widget>[
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 24,
                  right: 12,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 18),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildRowInformationItem(
                    Icons.schedule,
                    "${meal.duration} min",
                  ),
                  _buildRowInformationItem(
                    Icons.work,
                    meal.complexityText,
                  ),
                  _buildRowInformationItem(
                    Icons.attach_money,
                    meal.affordabilityText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
