import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class UserDisplayer extends StatelessWidget {
  const UserDisplayer({
    Key? key, required this.name, required this.rating,
  }) : super(key: key);
  final String name;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          backgroundColor: blue,
          radius: 30,
          child: Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Text(name),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: yellow, size: 17),
            const SizedBox(width: 5),
            Text(rating.toString())
          ],
        )
      ],
    );
  }
}
