import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/models/models.dart';
import 'package:food_recipe_apprentice/screens/explore_screen.dart';
import 'package:food_recipe_apprentice/screens/grocery_screen.dart';
import 'package:food_recipe_apprentice/screens/recipes_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = [
    const ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Fooderlich',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          body: pages[tabManager.selectedTab],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabManager.selectedTab,
            onTap: (index) {
              tabManager.goToTab(index);
            },
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt), label: 'Recipes'),
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'To Buy'),
            ],
          ),
        );
      },
    );
  }
}
