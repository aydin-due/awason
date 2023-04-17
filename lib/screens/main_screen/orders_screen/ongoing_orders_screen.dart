import 'package:awason/models/models.dart';
import 'package:awason/services/services.dart';
import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OngoingOrdersScreen extends StatefulWidget {
  const OngoingOrdersScreen({super.key});

  @override
  State<OngoingOrdersScreen> createState() => _OngoingOrdersScreenState();
}

class _OngoingOrdersScreenState extends State<OngoingOrdersScreen> {
  final apiService = OrderService();

  void refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiService.getOngoingOrders(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasError) {
          return Expanded(
            child: Center(
              child: Text(
                snapshot.error.toString().split(": ")[1],
                style: blueLink,
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
              if (snapshot.data!.status == "FAILED") {
              return const Center(
                child: Text('No se encontraron pedidos'),
              );
            }
          return Expanded(
            child: ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (ctx, index) {
                final Order order = snapshot.data!.data![index];
                final IdClient orderClient = IdClient.fromJson(order.clientId);

                final clientFullName =
                    '${orderClient.nombre} ${orderClient.apellidos}';
                final clientAddress =
                    '${orderClient.direccion!.calle} #${orderClient.direccion!.numero} ${orderClient.direccion!.colonia}';
                final gallons = order.gallons.toString();
                final clientSchedule =
                    '${orderClient.horario!.horaInicial} - ${orderClient.horario!.horaFinal} horas';

                return OngoingOrderCard(
                  orderId: order.id ?? '1',
                  name: clientFullName,
                  address: clientAddress,
                  gallons: gallons,
                  time: clientSchedule,
                  refresh: refresh,
                );
              },
            ),
          );
        }

        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
