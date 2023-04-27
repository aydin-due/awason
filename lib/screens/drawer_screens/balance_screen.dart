import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: Texts.ganancias),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: const [
            BalanceCard(
              balance: '\$0.00',
            ),
            BalanceDetails(
              total: '\$0.00',
              servicio: '\$0.00',
              ganacias: '\$0.00',
            ),
            BalanceHistory(day: '22', month: 'Abr', name: 'Tomasito Wapo', quantity: '2', total: '\$0.00',)
          ],
        ),
      ),
    );
  }
}