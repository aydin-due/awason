import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CardContainer(
        child: RequestCard(
      name: 'Tomasito',
      address: 'Buena Vista #1',
      gallons: '2',
      time: '2:00 pm - 4:00 pm',
    ));
  }
}