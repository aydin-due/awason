import 'package:awason/models/models.dart';
import 'package:awason/services/services.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PendingOrdersScreen extends StatefulWidget {
  const PendingOrdersScreen({
    super.key,
  });

  @override
  State<PendingOrdersScreen> createState() => _PendingOrdersScreenState();
}

class _PendingOrdersScreenState extends State<PendingOrdersScreen> {
  final _apiService = OrderService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _apiService.getPendingOrders(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.status == "FAILED") {
              return const Center(
                child: Text('No se encontraron pedidos'),
              );
            }
            final List<Order> requests = snapshot.data!.data!;
            return Expanded(
              child: ListView.builder(
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  final Order order = requests[index];
                  final IdClient client = IdClient.fromJson(order.clientId);
                  return PendingOrderCard(
                    name: '${client.nombre} ${client.apellidos}',
                    address:
                        '${client.direccion!.calle} ${client.direccion!.numero} ${client.direccion!.colonia}',
                    gallons: order.gallons.toString(),
                    time:
                        '${client.horario!.horaInicial} - ${client.horario!.horaFinal} horas',
                    startDelivery: () async {
                      await _apiService
                          .startDelivery(order.id!)
                          .then((value) => setState(() {}));
                    },
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
