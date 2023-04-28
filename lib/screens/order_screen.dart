import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String order = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: CustomAppBar(title: Texts.entrega,),
      body: Center(
        child: Text(order),
      ),
    );
  }
}
