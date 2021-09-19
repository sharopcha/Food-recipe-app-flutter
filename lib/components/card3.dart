import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/fooderlich_theme.dart';

class Card3 extends StatelessWidget {
  const Card3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 380, height: 600),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/magazine_pics/mag2.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
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
                    'Recipe Trends',
                    style: FooderlichTheme.darkTextTheme.headline2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        Chip(
                          label: Text(
                            'Healthy',
                            style: FooderlichTheme.darkTextTheme.bodyText1,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onDeleted: () {
                            // ignore: avoid_print
                            print('chip deleted');
                          },
                        ),
                        Chip(
                          label: Text(
                            'Vegan',
                            style: FooderlichTheme.darkTextTheme.bodyText1,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onDeleted: () {
                            // ignore: avoid_print
                            print('chip deleted');
                          },
                        ),
                        Chip(
                          label: Text(
                            'Carrots',
                            style: FooderlichTheme.darkTextTheme.bodyText1,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onDeleted: () {
                            // ignore: avoid_print
                            print('chip deleted');
                          },
                        ),
                        Chip(
                          label: Text(
                            'Chicken',
                            style: FooderlichTheme.darkTextTheme.bodyText1,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onDeleted: () {
                            // ignore: avoid_print
                            print('chip deleted');
                          },
                        ),
                        Chip(
                          label: Text(
                            'Beef',
                            style: FooderlichTheme.darkTextTheme.bodyText1,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onDeleted: () {
                            // ignore: avoid_print
                            print('chip deleted');
                          },
                        ),
                        Chip(
                          label: Text(
                            'Greens',
                            style: FooderlichTheme.darkTextTheme.bodyText1,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onDeleted: () {
                            // ignore: avoid_print
                            print('chip deleted');
                          },
                        ),
                        Chip(
                          label: Text(
                            'Pascetarian',
                            style: FooderlichTheme.darkTextTheme.bodyText1,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onDeleted: () {
                            // ignore: avoid_print
                            print('chip deleted');
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
