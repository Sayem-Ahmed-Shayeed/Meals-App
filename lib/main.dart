import 'package:flutter/material.dart';
import 'package:meals/categories_screen.dart';
import 'package:meals/main_drawer.dart';
import 'package:meals/meal.dart';
import 'package:meals/models/data/dummy_data.dart';
import 'package:meals/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const Tabs(),
    );
  }
}
