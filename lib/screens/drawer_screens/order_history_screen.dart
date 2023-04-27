import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: Texts.historial),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: OrderHistoryCard(),
      )
    );
  }
}