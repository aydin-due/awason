
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PendingOrdersScreen extends StatelessWidget {
  const PendingOrdersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const PendingOrderCard(
            name: 'Tomasito',
            address: 'Buena Vista #1',
            gallons: '2',
            time: '11:00 pm - 12:00 pm',
          );
        },
      ),
    );
  }
}