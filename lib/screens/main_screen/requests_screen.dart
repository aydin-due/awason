import 'package:awason/models/models.dart';
import 'package:awason/services/services.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  final _apiService = OrderService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _apiService.getOrderRequest(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.status == "FAILED") {
              return const Center(
                child: Text('No hay solicitudes'),
              );
            }
            final List<Order> requests = snapshot.data!.data!;
            return ListView.builder(
              itemCount: requests.length,
              itemBuilder: (context, index) {
                final Order request = requests[index];
                final Client client = Client.fromJson(request.clientId!);
                return CardContainer(
                    child: RequestCard(
                  name: '${client.nombre} ${client.apellidos}',
                  address:
                      '${client.direccion!.calle} ${client.direccion!.numero} ${client.direccion!.colonia}',
                  gallons: request.gallons.toString(),
                  time:
                      '${client.horario!.horaInicial} - ${client.horario!.horaFinal} horas',
                  declineRequest: () async {
                    await _apiService
                        .declineRequest(request.id!)
                        .then((value) => setState(() {}));
                  },
                  acceptRequest: () async {
                    _apiService
                        .acceptRequest(order: request.id!)
                        .then((value) => setState(() {}));
                  },
                ));
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
