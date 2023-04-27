import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class BalanceHistory extends StatelessWidget {
  const BalanceHistory({
    super.key,
    required this.day,
    required this.month,
    required this.name,
    required this.quantity,
    required this.total,
  });
  final String day;
  final String month;
  final String name;
  final String quantity;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            Texts.ultimasTransacciones,
            style: appbarTitle,
          ),
        ),
        const SizedBox(height: 10),
        ListTile(
            title: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                name,
                style: listTileTitle,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text('$quantity garrafones'),
            ),
            isThreeLine: true,
            leading: Container(
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: gray,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      day,
                      style: boldDateText,
                    ),
                    Text(month)
                  ],
                ),
              ),
            ),
            trailing: Text(total),),
      ],
    );
  }
}
