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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Image.asset('assets/blue_logo.png'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                Texts.bienvenido,
                style: heading,
              ),
            ),
            const LoginForm(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(Texts.noTienesCuenta, style: plainText,),
                  TextButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, Routes.register);
                    },
                    child: const Text(Texts.registrate, style: blueLink,),
                  ),
                ],
              ),
            ),
          ],
        ),
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
            const Text(
              Texts.subtitleLogin,
              style: subtitle,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: inputDecoration.copyWith(
                hintText: Texts.correo,
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: inputDecoration.copyWith(
                hintText: Texts.contra,
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: blueBlockButton,
              onPressed: () {
                // Navigator.pushNamed(context, Routes.home);
              },
              child: const Text(Texts.entrar, style: blueButtonText,),
            ),
          ],
        ));
  }
}
