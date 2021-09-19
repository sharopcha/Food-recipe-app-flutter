import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/components/circle_image.dart';
import 'package:food_recipe_apprentice/fooderlich_theme.dart';

class AuthorCard extends StatefulWidget {
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
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;

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
                imageProvider: widget.imageProvider,
                imageradius: 28,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName,
                    style: FooderlichTheme.lightTextTheme.headline3,
                  ),
                  Text(
                    widget.title,
                    style: FooderlichTheme.lightTextTheme.headline4,
                  )
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              _isFavorited ? Icons.favorite : Icons.favorite_border,
            ),
            iconSize: 30,
            color: _isFavorited ? Colors.red[400] : Colors.grey[400],
            onPressed: () {
              setState(() {
                _isFavorited = !_isFavorited;
              });
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
