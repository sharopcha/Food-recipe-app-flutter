import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/fooderlich_theme.dart';
import 'package:food_recipe_apprentice/models/explore_recipe.dart';

class Card3 extends StatelessWidget {
  const Card3({Key? key, required this.recipe}) : super(key: key);

  final ExploreRecipe recipe;

  List<Widget> createChips() {
    final chips = <Widget>[];

    recipe.tags!.take(6).forEach((element) {
      final chip = Chip(
        label: Text(
          element,
          style: FooderlichTheme.darkTextTheme.bodyText1,
        ),
        backgroundColor: Colors.black.withOpacity(0.7),
        onDeleted: () {
          // ignore: avoid_print
          print('chip deleted');
        },
      );

      chips.add(chip);
    });

    return chips;
  }

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
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    recipe.title.toString(),
                    style: FooderlichTheme.darkTextTheme.headline2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Wrap(
                      spacing: 12,
                      alignment: WrapAlignment.start,
                      children: createChips(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
