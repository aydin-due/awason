import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/card_container.dart';
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

class OngoingOrders extends StatelessWidget {
  const OngoingOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Pedido $index'),
            subtitle: Text('Subtitulo $index'),
            trailing: Text('Trailing $index'),
          );
        },
      ),
    );
  }
}
