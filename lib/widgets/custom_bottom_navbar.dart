import 'package:awason/providers/providers.dart';
import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarProvider>(context);
    final index = provider.currentIndex;

    return BottomNavigationBar(
        currentIndex: index,
        onTap: (index) => provider.currentIndex = index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: Texts.inicio),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: Texts.pedidos),
          BottomNavigationBarItem(icon: Icon(Icons.bus_alert), label: Texts.solicitudes),
        ]);
  }
}
