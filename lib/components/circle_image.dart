import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage(
      {Key? key, required this.imageProvider, this.imageradius = 20})
      : super(key: key);

  final double imageradius;
  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: imageradius,
      child: CircleAvatar(
        radius: imageradius - 5,
        backgroundImage: imageProvider,
      ),
    );
  }
}
