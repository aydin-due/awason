import 'package:awason/models/models.dart';
import 'package:awason/services/services.dart';
import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OngoingOrderCard extends StatefulWidget {
  const OngoingOrderCard({
    super.key,
    required this.orderId,
    required this.name,
    required this.address,
    required this.time,
    required this.gallons,
    required this.refresh,
  });
  final String orderId;
  final String name;
  final String address;
  final String time;
  final String gallons;
  final VoidCallback refresh;

  @override
  State<OngoingOrderCard> createState() => _OngoingOrderCardState();
}

class _OngoingOrderCardState extends State<OngoingOrderCard> {
  Future<void> _showGenericDialog(String title, String content) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title, style: boldText),
        content: Text(content, style: plainText),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'OK',
              style: boldText,
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> _showConfirmationDialog() async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          content: const Text(
            '¿Estás seguro de que deseas cancelar la entrega?',
            style: boldText,
          ),
          actions: [
            ElevatedButton(
              style: blueButton,
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Aceptar'),
            ),
            ElevatedButton(
              style: blueButton,
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void finishDelivery() async {
    try {
      final apiService = OrderService();
      await apiService.finishDelivery(widget.orderId);

      //TODO: Should push to end of delivery screen or whatever
      await _showGenericDialog(
        'Entrega terminada',
        'La entrega ha sido terminada exitosamente.',
      );

      widget.refresh();
    } on Exception catch (error) {
      _showGenericDialog(
        'Ha ocurrido un error',
        error.toString().split(": ")[1],
      );
    }
  }

  void cancelDelivery() async {
    try {
      final dialogResult = await _showConfirmationDialog() ?? false;

      if (!dialogResult) return;

      final apiService = OrderService();
      await apiService.cancelDelivery(widget.orderId);

      await _showGenericDialog(
        'Entrega cancelada',
        'La entrega ha sido cancelada exitosamente.',
      );

      widget.refresh();
    } on Exception catch (error) {
      _showGenericDialog(
        'Ha ocurrido un error',
        error.toString().split(": ")[1],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      height: 0.18,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardData(title: 'Nombre: ', value: widget.name),
                  CardData(title: 'Dirección: ', value: widget.address),
                  CardData(title: 'Garrafones: ', value: widget.gallons),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Text(widget.time, style: boldText),
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
                onPressed: cancelDelivery,
                child: const Text(
                  Texts.cancelarEntrega,
                  style: boldText,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                onPressed: finishDelivery,
                child: const Text(
                  Texts.confirmarEntrega,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
