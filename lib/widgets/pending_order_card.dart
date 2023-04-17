import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PendingOrderCard extends StatelessWidget {
  const PendingOrderCard({
    super.key,
    required this.name,
    required this.address,
    required this.time,
    required this.gallons,
    required this.startDelivery,
  });
  final String name;
  final String address;
  final String time;
  final String gallons;
  final Function startDelivery;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        height: .20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      CardData(title: 'Nombre: ', value: name),
                      CardData(title: 'Dirección: ', value: address),
                      CardData(title: 'Garrafones: ', value: gallons),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  time,
                  style: boldText,
                ),
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                onPressed: () => startDelivery(),
                child: const Text(Texts.estoyEnCamino)),
          ],
        ));
  }
}
