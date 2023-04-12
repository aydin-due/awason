import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
  const CardData({
    super.key, required this.title, required this.value,
  });
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: boldText,
        ),
        Text(
          value,
          style: plainText,
        ),
      ],
    );
  }
}
