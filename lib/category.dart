import 'package:flutter/material.dart';
import 'package:meals/models/category_blueprint.dart';

class CategoryGridItem extends StatelessWidget {
  CategoryGridItem(
      {super.key, required this.category, required this.goToMealScreen});

  final Category category;
  void Function(BuildContext context, Category category, String title)
      goToMealScreen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToMealScreen(context, category, category.title);
      },
      splashColor: Colors.black,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(244, 246, 142, 229),
              Color.fromARGB(244, 183, 87, 167),
            ],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
