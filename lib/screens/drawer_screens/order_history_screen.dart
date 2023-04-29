import 'package:awason/models/models.dart';
import 'package:awason/services/services.dart';
import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: Texts.historial),
        body: FutureBuilder(
            future: OrderService().getDeliveryHistory(),
            builder:
                (BuildContext context, AsyncSnapshot<OrdersResponse> snapshot) {
              if (snapshot.hasData) {
                final List<Order> orders = snapshot.data!.data!;
                var formatter = DateFormat('dd/MM/yyyy');
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final Client client = Client.fromJson(orders[index].clientId);
                      return GestureDetector(
                          onTap: () => Navigator.pushNamed(context, Routes.order,
                              arguments: orders[index].id),
                          child: OrderHistoryCard(
                            name: client.nombre!,
                            address: '${client.direccion!.calle} ${client.direccion!.numero} ${client.direccion!.colonia}',
                            gallons: orders[index].gallons.toString(),
                            date: formatter.format(orders[index].orderDate!),
                          ));
                    }
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
