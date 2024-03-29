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
  final _apiService = OrderService();

  void refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _apiService.getOngoingOrders(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString().split(": ")[1],
              style: blueLink,
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
                final Client orderClient = Client.fromJson(order.clientId);

                final clientFullName =
                    '${orderClient.nombre} ${orderClient.apellidos}';
                final clientAddress =
                    '${orderClient.direccion!.calle} #${orderClient.direccion!.numero} ${orderClient.direccion!.colonia}';
                final gallons = order.gallons.toString();
                final clientSchedule =
                    '${orderClient.horario!.horaInicial} - ${orderClient.horario!.horaFinal} horas';

                return OngoingOrderCard(
                  id: order.id!,
                  name: clientFullName,
                  address: clientAddress,
                  gallons: gallons,
                  time: clientSchedule,
                  finishDelivery: () async {
                    _apiService.finishDelivery(order.id!).then(
                      (value) {
                        if (value.status == "SUCCESS") {
                          final double subtotal = order.price! * order.gallons!;
                          _showFinishedDeliveryModal(
                                  context, subtotal, order.id!)
                              .then((value) => refresh());
                        }
                      },
                    );
                  },
                  cancelDelivery: () async {
                    _apiService.cancelDelivery(order.id!).then(
                      (value) {
                        if (value.status == "SUCCESS") {
                          refresh();
                        }
                      },
                    );
                  },
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

  Future<dynamic> _showFinishedDeliveryModal(
      BuildContext context, double subtotal, String order) {
    int stars = 0;
    TextEditingController comentarios = TextEditingController();
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        isScrollControlled: true,
        context: context,
        builder: (ctx) =>
            StatefulBuilder(builder: (BuildContext context, StateSetter state) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Has ganado',
                        ),
                        Text(
                          '\$$subtotal',
                          style: appbarTitle,
                        ),
                        Center(
                          child: SizedBox(
                            height: 50,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) => IconButton(
                                  splashRadius: 1,
                                  onPressed: () {
                                    state(() {
                                      stars = index + 1;
                                    });
                                  },
                                  icon: Icon(
                                    index < stars
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: yellow,
                                  )),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: comentarios,
                          decoration: inputDecoration.copyWith(
                            hintText: Texts.comentarios,
                            prefixIcon: const Icon(Icons.comment),
                          ),
                          maxLines: 3,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: blueButton,
                          onPressed: () async {
                            GenericResponse response = await OrderService()
                                .reviewClient(
                                    order: order,
                                    review: stars.toString(),
                                    comment: comentarios.text);
                            if (response.status == "SUCCESS") {
                              if (mounted) {
                                Navigator.pop(context);
                              }
                            }
                          },
                          child: const Text(Texts.realizarReview),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }));
  }
}
