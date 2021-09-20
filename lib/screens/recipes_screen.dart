import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/api/mock_fooderlich_service.dart';
import 'package:food_recipe_apprentice/components/recipes_crid_view.dart';
import 'package:food_recipe_apprentice/models/models.dart';

class RecipesScreen extends StatelessWidget {
  RecipesScreen({Key? key}) : super(key: key);

  final exploreService = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SimpleRecipe>>(
      future: exploreService.getRecipes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipesGridView(recipes: snapshot.data as List<SimpleRecipe>);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
