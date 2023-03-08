import 'package:awason/providers/providers.dart';
import 'package:awason/screens/screens.dart';
import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final Widget content;
    final String title;
    final provider = Provider.of<BottomNavBarProvider>(context);

    switch(provider.currentIndex){
      case 0:
        content = const HomeScreen();
        title = Texts.inicio;
        break;
      case 1:
        content = const OrdersScreen();
        title = Texts.pedidos;
        break;
      case 2:
        content = const RequestsScreen();
        title = Texts.solicitudes;
        break;
      default:
        content = const HomeScreen();
        title = Texts.inicio;
        break;
    }

    return Scaffold(
      appBar: CustomAppBar(title: title,),
      drawer: const CustomDrawer(),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: content),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}