import 'package:awason/models/models.dart';
import 'package:awason/services/order_service.dart';
import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String order = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: const CustomAppBar(
        title: Texts.entrega,
      ),
      body: FutureBuilder(
          future: OrderService().getDeliveryHistory(order),
          builder:
              (BuildContext context, AsyncSnapshot<OrderResponse> snapshot) {
            if (snapshot.hasData) {
              final Order order = snapshot.data!.data!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    _summaryData(order),
                    _paymentData(order),
                    _detailsData(order),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  CardContainer _summaryData(Order order) {
    final subtotal = order.price! * order.gallons!;
    var formatter = DateFormat('EEEE, MMMM d, yyyy');

    return CardContainer(
      setHeight: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                Texts.resumen,
                style: boldDateText,
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: lightBlue, borderRadius: BorderRadius.circular(20)),
                child: Text(
                  order.deliveryStatus == 'done' ? Texts.entregado : Texts.pendiente,
                  style: blueLink,
                ),
              )
            ],
          ),
          RowData(
            title: Texts.fecha,
            value: formatter.format(order.orderDate!),
          ),
          RowData(
            title: Texts.garrafones,
            value: '${order.gallons}',
          ),
          RowData(
            title: Texts.precio,
            value: '\$${order.price}',
          ),
          RowData(
            title: Texts.subtotal,
            value: '\$$subtotal',
          ),
          RowData(
            title: Texts.servicio,
            value: '\$${order.tax}',
          ),
          RowData(
            title: Texts.total,
            value: '\$${order.total}',
          ),
        ],
      ),
    );
  }

  CardContainer _paymentData(Order order) {
    final subtotal = order.price! * order.gallons!;
    return CardContainer(
      setHeight: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            Texts.ganancias,
            style: smallGrayText,
          ),
          Text(
            '\$$subtotal',
            style: boldDateText,
          )
        ],
      ),
    );
  }

  CardContainer _detailsData(Order order) {
    final subtotal = order.price! * order.gallons!;
    final Client client = Client.fromJson(order.clientId);
    final String addressL1 = '${client.direccion!.calle} ${client.direccion!.numero} ${client.direccion!.colonia}';
    final String addressL2 = '${client.direccion!.ciudad} ${client.direccion!.codigoPostal}';

    return CardContainer(
      setHeight: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            Texts.detalles,
            style: boldDateText,
          ),
          const SizedBox(height: 10),
          const Text(
            Texts.direccion,
            style: smallGrayText,
          ),
          const SizedBox(height: 5),
          Text(
            addressL1,
            style: plainText,
          ),
          const SizedBox(height: 5),
          Text(
            addressL2,
            style: plainText,
          ),
          const SizedBox(height: 5),
          const Text(
            'Sonora, México',
            style: plainText,
          ),
        ],
      ),
    );
  }
}
