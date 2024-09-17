import 'package:flutter/material.dart';
import 'package:meals/Actress.dart';
import 'package:meals/main_drawer.dart';

class MealDetailsScreen extends StatelessWidget {
  MealDetailsScreen(
      {super.key,
      required this.meal,
      required this.onFavouriteTap,
      required this.favourite});

  final Meal meal;
  void Function(Meal meal) onFavouriteTap;
  List<Meal> favourite;

  @override
  Widget build(BuildContext context) {
    var favIconColor = Colors.grey;
    if (favourite.contains(meal)) {
      favIconColor = Colors.pink;
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            //change the fav icon color here
            onPressed: () {
              onFavouriteTap(meal);
            },
            icon: Icon(
              Icons.star,
              color: favIconColor,
            ),
          ),
        ],
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.network(
                  meal.imageUrl,
                  height: 200,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                'Ingredients: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              for (final ingredient in meal.ingredients) Text(ingredient),
              const SizedBox(height: 12),
              const Text(
                'Steps: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              for (final step in meal.steps) Text(step),
            ],
          ),
        ),
      ),
    );
  }
}
