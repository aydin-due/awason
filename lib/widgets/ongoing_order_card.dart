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
    required this.finishDelivery,
    required this.cancelDelivery, required this.id,
  });
  final String id;
  final String name;
  final String address;
  final String time;
  final String gallons;
  final Function finishDelivery;
  final Function cancelDelivery;

  @override
  Widget build(BuildContext context) {
    Future<bool?> showConfirmationDialog({required String content}) async {
      return showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            content: Text(
              content,
              style: boldText,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                style: blueButton,
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    }

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(Routes.order, arguments: id),
      child: CardContainer(
        height: .19,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardData(title: 'Nombre: ', value: name),
                      CardData(title: 'Dirección: ', value: address),
                      CardData(title: 'Garrafones: ', value: gallons),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Text(time, style: boldText),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: const Size(0, 0),
                  ),
                  onPressed: () => showConfirmationDialog(
                          content:
                              '¿Estás seguro de que deseas cancelar la entrega?')
                      .then((value) {
                    if (value == true) {
                      cancelDelivery();
                    }
                  }),
                  child: const Text(
                    Texts.cancelarEntrega,
                    style: boldText,
                  ),
                ),
                ElevatedButton(
                  style: blueButton,
                  onPressed: () => showConfirmationDialog(
                          content:
                              '¿Estás seguro de que deseas finalizar la entrega?')
                      .then((value) {
                    if (value == true) {
                      finishDelivery();
                    }
                  }),
                  child: const Text(
                    Texts.confirmarEntrega,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
