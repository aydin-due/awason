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
    required this.declineRequest,
    required this.acceptRequest,
  });
  final String name;
  final String address;
  final String time;
  final String gallons;
  final Function declineRequest;
  final Function acceptRequest;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
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
        ),
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
                  onPressed: () => declineRequest(),
                ),
                CircularIconButton(
                  icon: Icons.check,
                  color: green,
                  onPressed: () => acceptRequest(),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
