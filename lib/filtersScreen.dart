import 'package:flutter/material.dart';
import 'package:meals/main_drawer.dart';
import 'package:meals/tabs.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  FiltersScreen({super.key, required this.result});

  Map<Filter, bool> result;
  @override
  State<StatefulWidget> createState() {
    return _FiltersScreen();
  }
}

class _FiltersScreen extends State<FiltersScreen> {
  var glutenFreeFilterSet = false;
  var lactoseFreeFilterSet = false;
  var vegetarianFilterSet = false;
  var veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    glutenFreeFilterSet = widget.result[Filter.glutenFree]!;
    lactoseFreeFilterSet = widget.result[Filter.lactoseFree]!;
    vegetarianFilterSet = widget.result[Filter.vegetarian]!;
    veganFilterSet = widget.result[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        drawer: MainDrawer(onSelectDrawer: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'Meals') {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const Tabs()),
            );
          }
        }),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pop({
              Filter.glutenFree: glutenFreeFilterSet,
              Filter.lactoseFree: lactoseFreeFilterSet,
              Filter.vegetarian: veganFilterSet,
              Filter.vegan: veganFilterSet,
            });
            return false;
          },
          child: Column(
            children: [
              SwitchListTile(
                value: glutenFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    glutenFreeFilterSet = isChecked;
                  });
                },
                title: const Text('Gluten-Free'),
                subtitle: const Text('Only includes gluten-free meals'),
                activeColor: Colors.pink,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: lactoseFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    lactoseFreeFilterSet = isChecked;
                  });
                },
                title: const Text('Lactose-Free'),
                subtitle: const Text('Only includes lactose-free meals'),
                activeColor: Colors.pink,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: vegetarianFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    vegetarianFilterSet = isChecked;
                  });
                },
                title: const Text('Vegetarian'),
                subtitle: const Text('Only includes Vegetarian meals'),
                activeColor: Colors.pink,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: veganFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    veganFilterSet = isChecked;
                  });
                },
                title: const Text('Vegan'),
                subtitle: const Text('Only includes Vegan meals'),
                activeColor: Colors.pink,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
            ],
          ),
        ));
  }
}
