import 'package:awason/screens/screens.dart';
import 'package:awason/services/services.dart';
import 'package:flutter/material.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: authService.readToken(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (!snapshot.hasData) return const Text('Espere...');
              if (snapshot.data == '') return const LoginScreen();
              return const MainScreen();
            }),
      ),
    );
  }
}
