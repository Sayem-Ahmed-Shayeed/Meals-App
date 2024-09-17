import 'package:flutter/material.dart';
import 'package:meals/Actress.dart';
import 'package:meals/meal_details_screen.dart';
import 'package:meals/meal_item.dart';

class MealScreen extends StatelessWidget {
  MealScreen({
    super.key,
    this.title,
    required this.meal,
    required this.onTapFavourite,
    required this.favourite,
  });

  final String? title;
  final List<Meal> meal, favourite;
  void Function(Meal) onTapFavourite;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          favourite: favourite,
          meal: meal,
          onFavouriteTap: onTapFavourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meal.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meal[index],
        onSelectMeal: _selectMeal,
      ),
    );

    if (meal.isEmpty) {
      content = const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Uh oh... Nothing here!",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Try selecting a different category",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      );
    }
    if (title == null) {
      return Scaffold(
        body: content,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        centerTitle: true,
      ),
      body: content,
    );
  }
}
