import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Texts.historial),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.order, arguments: '643d79e9daa1528d8ae5c156'),
          child: const OrderHistoryCard()),
      )
    );
  }
}