import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OngoingOrderCard extends StatelessWidget {
  const OngoingOrderCard({
    super.key,
    required this.name,
    required this.address,
    required this.time,
    required this.gallons,
  });
  final String name;
  final String address;
  final String time;
  final String gallons;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        height: 0.18,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardData(title: 'Nombre: ', value: name),
            CardData(title: 'Dirección: ', value: address),
            CardData(title: 'Garrafones: ', value: gallons),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: const Size(0, 0)),
                    onPressed: () {},
                    child: const Text(Texts.cancelarEntrega, style: boldText)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    onPressed: () {},
                    child: const Text(Texts.confirmarEntrega))
              ],
            )
          ],
        ));
  }
}
