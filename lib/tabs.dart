import 'package:flutter/material.dart';
import 'package:meals/categories_screen.dart';
import 'package:meals/filtersScreen.dart';
import 'package:meals/meal.dart';
import 'package:meals/models/data/dummy_data.dart';

import 'Actress.dart';
import 'main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() {
    return _Tabs();
  }
}

class _Tabs extends State<Tabs> {
  List<Meal> favourite = [];
  Map<Filter, bool> selectedFilter = kInitialFilters;
  var _selectedPageIndex = 0;
  var favIconColor = Colors.grey;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Future<void> onSelectDrawer(String identifier) async {
    if (identifier == 'Meals') {
      Navigator.of(context).pop();
    } else {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
            builder: (ctx) => FiltersScreen(
                  result: selectedFilter,
                )),
      );
      setState(() {
        selectedFilter = result ?? kInitialFilters;
      });
    }
  }

  void showSnackBar(String textItem) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(textItem),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
      ),
    );
  }

  void onTapFavourite(Meal meal) {
    if (favourite.contains(meal)) {
      setState(() {
        showSnackBar('${meal.title} was removed from favourite');
        favourite.remove(meal);
      });
    } else {
      setState(() {
        showSnackBar('${meal.title} is added to the favourite');
        favourite.add(meal);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Meal> availableMeal = dummyMeals.where((meal) {
      if (!meal.isGlutenFree && selectedFilter[Filter.glutenFree]!) {
        return false;
      }
      if (!meal.isLactoseFree && selectedFilter[Filter.lactoseFree]!) {
        return false;
      }
      if (!meal.isVegetarian && selectedFilter[Filter.vegetarian]!) {
        return false;
      }
      if (!meal.isVegan && selectedFilter[Filter.vegan]!) {
        return false;
      }
      return true;
    }).toList();

    var activePageTitle = 'Pick your Category';
    Widget activePage = CategoriesScreen(
      availableMeals: availableMeal,
      favourite: favourite,
      onTapFavourite: onTapFavourite,
    );

    if (_selectedPageIndex == 1) {
      activePageTitle = 'Your Favourite';
      activePage = MealScreen(
        meal: favourite,
        title: null,
        onTapFavourite: onTapFavourite,
        favourite: favourite,
      );
    }
    return Scaffold(
      body: activePage,
      appBar: AppBar(
        title: Text(activePageTitle),
        foregroundColor: Colors.black,
      ),
      drawer: MainDrawer(
        onSelectDrawer: onSelectDrawer,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        fixedColor: Colors.pink,
        items: const [
          BottomNavigationBarItem(
            label: 'Category',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'Favourite',
            icon: Icon(
              Icons.favorite,
            ),
          ),
        ],
      ),
    );
  }
}
