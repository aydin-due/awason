import 'package:awason/providers/providers.dart';
import 'package:awason/screens/screens.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List screens = [const HomeScreen(), const OrdersScreen(), const RequestsScreen()];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavBarProvider>(context);
    final index = provider.currentIndex;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: screens[index]),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
