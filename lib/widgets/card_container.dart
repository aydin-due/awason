import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.child,
    this.height = 0.15,
    this.setHeight = true,
  });
  final Widget child;
  final double height;
  final bool setHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: setHeight ? MediaQuery.of(context).size.height * height : null,
      child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: gray, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: child,
          )),
    );
  }
}
