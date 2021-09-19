import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/api/mock_fooderlich_service.dart';
import 'package:food_recipe_apprentice/components/friend_post_list_view.dart';
import 'package:food_recipe_apprentice/components/friend_post_tile.dart';
import 'package:food_recipe_apprentice/components/today_recipe_list_view.dart';
import 'package:food_recipe_apprentice/models/explore_data.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);

  final mockServer = MockFooderlichService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExploreData>(
      future: mockServer.getExploreData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final recipes = snapshot.data!.todayRecipes;

          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(recipes: recipes),
              const SizedBox(
                height: 16,
              ),
              FriendPostListView(friendPosts: snapshot.data!.friendPosts),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
