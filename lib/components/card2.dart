import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/components/author_card.dart';
import 'package:food_recipe_apprentice/fooderlich_theme.dart';
import 'package:food_recipe_apprentice/models/explore_recipe.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key, required this.recipe}) : super(key: key);
  final ExploreRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 380, height: 600),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(recipe.backgroundImage.toString()),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          children: [
            AuthorCard(
              authorName: recipe.authorName.toString(),
              title: recipe.role.toString(),
              imageProvider: AssetImage(recipe.profileImage.toString()),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(
                      recipe.title.toString(),
                      style: FooderlichTheme.lightTextTheme.headline1,
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        recipe.subtitle.toString(),
                        style: FooderlichTheme.lightTextTheme.headline1,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
