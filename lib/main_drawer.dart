import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({super.key, required this.onSelectDrawer});

  void Function(String identifier) onSelectDrawer;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.pinkAccent, Colors.blueAccent]),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking Up',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text('Meals'),
            onTap: () {
              onSelectDrawer('Meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Filters'),
            onTap: () {
              onSelectDrawer('Filters');
            },
          )
        ],
      ),
    );
  }
}
