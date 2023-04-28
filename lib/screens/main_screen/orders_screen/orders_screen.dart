import 'package:awason/screens/screens.dart';
import 'package:awason/utils/utils.dart';
import 'package:flutter/cupertino.dart';

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
              0: Text(Texts.pendientes),
              1: Text(Texts.enCurso),
            },
            onValueChanged: (value) {
              setState(() {
                groupValue = value!;
              });
            }),
        const SizedBox(
          height: 10,
        ),
        groupValue == 0 ? const PendingOrdersScreen() : const OngoingOrdersScreen(),
      ],
    );
  }
}
