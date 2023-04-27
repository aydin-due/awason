import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key, required this.balance,
  });
  final String balance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Size.infinite.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: gray, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        color: blue,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  Texts.gananciasTotales,
                  style: blueButtonText,
                ),
                Text(balance, style: lightHeading),
                const SizedBox(height: 10,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                    onPressed: () {}, child: const Text(Texts.retirar, style: blueLink,))
              ]),
        ),
      ),
    );
  }
}
