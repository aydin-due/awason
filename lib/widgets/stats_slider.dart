import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class StatsSlider extends StatelessWidget {
  const StatsSlider({
    super.key,
  });

  static const List<Map<String, dynamic>> stats = [
    {
      'title': 'Ganancias',
      'description': 'Total de ganancias que generaste esta semana',
      'icon': Icons.monetization_on,
    },
    {
      'title': 'Pedidos',
      'description': 'Pedidos que has completado esta semana',
      'icon': Icons.view_list_outlined,
    },
    {
      'title': 'Entregas',
      'description': 'Entregas que has realizado el dia de hoy',
      'icon': Icons.local_shipping,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Card(
              shape: cardDecor.copyWith(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(20),
                            height: 150,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                color: blue),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  stats[index]['icon'],
                                  color: Colors.white,
                                  size: 50,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  stats[index]['title'],
                                  style: sliderTitle,
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40, horizontal: 20),
                          child: Text(
                            stats[index]['description'],
                            style: plainText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Text(
                          '\$0.00',
                          style: heading,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset('assets/graph.png'),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
