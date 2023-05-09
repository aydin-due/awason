import 'package:awason/models/models.dart';
import 'package:awason/services/order_service.dart';
import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceHistory extends StatelessWidget {
  const BalanceHistory({
    super.key,
  });

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
        FutureBuilder(
            future: OrderService().getDeliveryHistory(),
            builder:
                (BuildContext context, AsyncSnapshot<OrdersResponse> snapshot) {
              if (!snapshot.hasData) {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              }
              final List<Order>? orders = snapshot.data!.data;

              if (orders == null || orders.isEmpty) {
                return const Expanded(
                  child: Center(
                    child: Text('No se encontró información'),
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                    itemCount: orders.length > 7 ? 7 : orders.length,
                    itemBuilder: (context, index) {
                      final Client client =
                          Client.fromJson(orders[index].clientId);
                      return TransactionItem(
                          name: client.nombre!,
                          quantity: '${orders[index].gallons}',
                          day:
                              DateFormat('dd').format(orders[index].orderDate!),
                          month: DateFormat('MMM')
                              .format(orders[index].orderDate!),
                          total: '\$${orders[index].total}');
                    }),
              );
            }),
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.name,
    required this.quantity,
    required this.day,
    required this.month,
    required this.total,
  });

  final String name;
  final String quantity;
  final String day;
  final String month;
  final String total;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          name,
          style: listTileTitle,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(int.parse(quantity) > 1 ? '$quantity garrafones' : '$quantity garrafón'),
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
      trailing: Text(total),
    );
  }
}
