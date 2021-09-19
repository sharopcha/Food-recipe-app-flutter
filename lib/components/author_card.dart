import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/components/circle_image.dart';
import 'package:food_recipe_apprentice/fooderlich_theme.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard(
      {Key? key,
      required this.authorName,
      required this.title,
      required this.imageProvider})
      : super(key: key);

  final String authorName;
  final String title;
  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: imageProvider,
                imageradius: 28,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    authorName,
                    style: FooderlichTheme.lightTextTheme.headline3,
                  ),
                  Text(
                    title,
                    style: FooderlichTheme.lightTextTheme.headline4,
                  )
                ],
              ),
            ],
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite_border,
            ),
            iconSize: 30,
            color: Colors.grey[400],
            onPressed: () {
              const snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('You favorited this author'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
      ),
    );
  }
}
