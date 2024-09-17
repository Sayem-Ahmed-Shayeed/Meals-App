import 'package:flutter/material.dart';
import 'package:meals/category.dart';
import 'package:meals/meal.dart';
import 'package:meals/models/data/dummy_data.dart';

import 'Actress.dart';
import 'filtersScreen.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen(
      {super.key,
      required this.onTapFavourite,
      required this.favourite,
      required this.availableMeals});

  void Function(Meal) onTapFavourite;
  List<Meal> availableMeals;
  List<Meal> favourite;

  void _selectCategory(BuildContext context, category, String title) {
    List<Meal> filteredMeal = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          onTapFavourite: onTapFavourite,
          title: title,
          meal: filteredMeal,
          favourite: favourite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final item in availableCategories)
          CategoryGridItem(goToMealScreen: _selectCategory, category: item)
      ],
    );
  }
}
