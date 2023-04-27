import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CardData(title: 'Nombre: ', value: 'name'),
              CardData(title: 'Dirección: ', value: 'address'),
              CardData(title: 'Garrafones: ', value: 'gallons'),
            ],
          ),
        ),
        const Spacer(),
        const Text(
          'time',
          style: boldText,
        ),
      ],
    ));
  }
}