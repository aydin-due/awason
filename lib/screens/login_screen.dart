import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset('assets/blue_logo.png'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(Texts.bienvenido, style: heading,),
            ),
            const LoginForm()
          ],
        )),
      ),
    ));
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(Texts.subtitleLogin, style: subtitle,),
          const SizedBox(height: 10,),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Correo electrónico',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ));
  }
}
