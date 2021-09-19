import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/fooderlich_theme.dart';
import 'package:food_recipe_apprentice/home.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final darkTheme = FooderlichTheme.dark();
    // final lightTheme = FooderlichTheme.light();

    return MaterialApp(
      // theme: lightTheme.copyWith(
      //     colorScheme:
      //         lightTheme.colorScheme.copyWith(secondary: Colors.black)),

      theme: darkTheme.copyWith(
          colorScheme:
              darkTheme.colorScheme.copyWith(secondary: Colors.green[600])),
      debugShowCheckedModeBanner: false,
      title: 'Fooderlich',
      home: Home(),
    );
  }
}
