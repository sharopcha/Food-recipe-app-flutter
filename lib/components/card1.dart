import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/fooderlich_theme.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread';
  final String chef = 'Azizmatov Shrofiddin';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.all(16),
      constraints: const BoxConstraints.expand(width: 380, height: 600),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/mag1.png'), fit: BoxFit.fill),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Stack(
        children: [
          Text(
            category,
            style: FooderlichTheme.darkTextTheme.bodyText1,
          ),
          Positioned(
            top: 20,
            child: Text(
              title,
              style: FooderlichTheme.darkTextTheme.headline5,
            ),
          ),
          Positioned(
            bottom: 30,
            right: 0,
            child: Text(
              description,
              style: FooderlichTheme.darkTextTheme.bodyText1,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: Text(
              chef,
              style: FooderlichTheme.darkTextTheme.bodyText1,
            ),
          )
        ],
      ),
    ));
  }
}
