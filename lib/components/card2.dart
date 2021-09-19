import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/components/author_card.dart';
import 'package:food_recipe_apprentice/fooderlich_theme.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 380, height: 600),
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/magazine_pics/mag5.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          children: [
            const AuthorCard(
              authorName: 'Azizmatov Shrofiddin',
              title: 'Smoothie Connoisseur',
              imageProvider: AssetImage('assets/profile_pics/author.JPG'),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(
                      'Recipe',
                      style: FooderlichTheme.lightTextTheme.headline1,
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'Smoothies',
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
