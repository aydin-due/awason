import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class BlueCircularIconButton extends StatelessWidget {
  const BlueCircularIconButton({
    Key? key, required this.icon, required this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onPressed(),
        icon: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: blue, borderRadius: BorderRadius.circular(20)),
          child: Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
        ));
  }
}
