import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
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
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardData(
              title: 'Nombre: ',
              value: name,
            ),
            CardData(
              title: 'Dirección: ',
              value: address,
            ),
            CardData(
              title: 'Garrafones: ',
              value: gallons,
            ),
          ],
        ),
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              time,
              style: boldText,
            ),
            Row(
              children: [
                CircularIconButton(
                  icon: Icons.close,
                  color: red,
                  onPressed: () {},
                ),
                CircularIconButton(
                  icon: Icons.check,
                  color: green,
                  onPressed: () {},
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
