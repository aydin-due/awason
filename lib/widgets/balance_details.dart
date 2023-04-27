import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class BalanceDetails extends StatelessWidget {
  const BalanceDetails(
      {super.key,
      required this.total,
      required this.servicio,
      required this.ganacias});
  final String total;
  final String servicio;
  final String ganacias;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: const Text(Texts.verDetalles),
        children: [
          ListTile(
            title: const Text(Texts.total),
            trailing: Text(total),
          ),
          ListTile(
            title: const Text(Texts.servicio),
            trailing: Text('-$servicio'),
          ),
          ListTile(
            title: const Text(Texts.ganancias),
            trailing: Text(ganacias),
          ),
        ],
      ),
    );
  }
}
