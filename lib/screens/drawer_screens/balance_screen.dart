import 'package:awason/models/models.dart';
import 'package:awason/services/carrier_service.dart';
import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const CustomAppBar(title: Texts.ganancias),
      body: FutureBuilder(
          future: CarrierService().getBalance(),
          builder:
              (BuildContext context, AsyncSnapshot<CarrierResponse> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final Balance balance = snapshot.data!.data!.balance!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  BalanceCard(
                    balance: '\$${balance.ganancias}',
                  ),
                  BalanceDetails(
                    total: '\$${balance.total}',
                    servicio: '\$${balance.servicio}',
                    ganacias: '\$${balance.ganancias}',
                  ),
                  const Expanded(child: BalanceHistory())
                ],
              ),
            );
          }),
    );
  }
}
