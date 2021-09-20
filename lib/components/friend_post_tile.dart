import 'package:flutter/material.dart';
import 'package:food_recipe_apprentice/components/circle_image.dart';
import 'package:food_recipe_apprentice/models/post.dart';

class FriendPostTile extends StatelessWidget {
  const FriendPostTile({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleImage(
          imageProvider: AssetImage(
            post.profileImageUrl.toString(),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.comment.toString(),
              ),
              Text(
                '${post.timestamp} mins ago',
                style: const TextStyle(fontWeight: FontWeight.w700),
              )
            ],
          ),
        )
      ],
    );
  }
}
