import 'package:awason/models/client.dart';
import 'package:awason/services/api_service.dart';
import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoSlidingSegmentedControl(
            groupValue: groupValue,
            children: const {
              0: Text('Pendientes'),
              1: Text('En curso'),
            },
            onValueChanged: (value) {
              setState(() {
                groupValue = value!;
              });
            }),
        const SizedBox(
          height: 10,
        ),
        groupValue == 0 ? const PendingOrders() : const OngoingOrders(),
      ],
    );
  }
}

class PendingOrders extends StatelessWidget {
  const PendingOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const PendingOrderCard(
            name: 'Tomasito',
            address: 'Buena Vista #1',
            gallons: '2',
            time: '11:00 pm - 12:00 pm',
          );
        },
      ),
    );
  }
}

class OngoingOrders extends StatefulWidget {
  const OngoingOrders({super.key});

  @override
  State<OngoingOrders> createState() => _OngoingOrdersState();
}

class _OngoingOrdersState extends State<OngoingOrders> {
  final apiService = ApiService();

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
          return Expanded(
            child: ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (ctx, index) {
                final order = snapshot.data!.data![index];
                final orderClient = Client.fromJson(order.clientId);

                final clientFullName =
                    '${orderClient.name} ${orderClient.surname}';
                final clientAddress =
                    '${orderClient.address!.street} #${orderClient.address!.houseNumber}';
                final gallons = order.gallons.toString();
                final clientSchedule =
                    '${orderClient.schedule!.startingTime}:00 - ${orderClient.schedule!.endingTime}:00';

                return OngoingOrderCard(
                  orderId: order.id!,
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
