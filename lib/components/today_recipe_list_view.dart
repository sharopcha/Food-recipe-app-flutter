import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/components/card1.dart';
import 'package:food_recipe_apprentice/components/card2.dart';
import 'package:food_recipe_apprentice/components/card3.dart';
import 'package:food_recipe_apprentice/models/explore_recipe.dart';

class TodayRecipeListView extends StatelessWidget {
  const TodayRecipeListView({Key? key, required this.recipes})
      : super(key: key);

  final List<ExploreRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        children: [
          Text(
            'Recipes of the Day',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 370,
            // TODO: Add list view here
            color: Colors.transparent,
            child: ListView.separated(
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return buildCard(recipe);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 16,
                  );
                },
                itemCount: recipes.length),
          )
        ],
      ),
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception("This card doesn't exist yet");
    }
  }
}
