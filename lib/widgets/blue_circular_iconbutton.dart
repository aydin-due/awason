import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color = blue,
  }) : super(key: key);
  final IconData icon;
  final Function onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onPressed(),
        icon: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
          child: Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
        ));
  }
}
