import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/components/card2.dart';
import 'package:food_recipe_apprentice/components/card3.dart';
import 'package:food_recipe_apprentice/models/models.dart';
import 'package:food_recipe_apprentice/screens/explore_screen.dart';
import 'package:food_recipe_apprentice/screens/recipes_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = [
    ExploreScreen(),
    RecipesScreen(),
    Card3(
      recipe: ExploreRecipe(
          title: 'Vegan Trends',
          tags: [
            'Healthy',
            'Vegan',
            'Carrots',
            'Greens',
            'Wheat',
            'Pescetarian',
            'Mint',
            'Lemongrass',
            'Salad',
            'Water'
          ],
          backgroundImage: 'assets/magazine_pics/mag3.png'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Fooderlich',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Recipes'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'To Buy'),
        ],
      ),
    );
  }
}
