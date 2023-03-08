import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            shape: cardDecor,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                children: [
                  Text(isActive ? Texts.activo : Texts.inactivo,
                      style: cardText),
                  const Spacer(),
                  Switch.adaptive(
                    value: isActive,
                    onChanged: (value) {
                      setState(() {
                        isActive = value;
                      });
                    },
                  )
                ],
              ),
            ))
      ],
    );
  }
}
