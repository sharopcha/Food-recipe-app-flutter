import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/fooderlich_theme.dart';
import 'package:food_recipe_apprentice/models/explore_recipe.dart';

class Card1 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card1({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints.expand(width: 380, height: 600),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(recipe.backgroundImage.toString()),
            fit: BoxFit.fill),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Stack(
        children: [
          Text(
            recipe.subtitle.toString(),
            style: FooderlichTheme.darkTextTheme.bodyText1,
          ),
          Positioned(
            top: 20,
            child: Text(
              recipe.title.toString(),
              style: FooderlichTheme.darkTextTheme.headline5,
            ),
          ),
          Positioned(
            bottom: 30,
            right: 0,
            child: Text(
              recipe.message.toString(),
              style: FooderlichTheme.darkTextTheme.bodyText1,
            ),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: Text(
              recipe.authorName.toString(),
              style: FooderlichTheme.darkTextTheme.bodyText1,
            ),
          )
        ],
      ),
    ));
  }
}
