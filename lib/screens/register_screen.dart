import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
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
              const RegisterForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    Texts.yaTienesCuenta,
                    style: plainText,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.login);
                    },
                    child: const Text(
                      Texts.iniciaSesion,
                      style: blueLink,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({
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
              Texts.subtitleRegister,
              style: subtitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: inputDecoration.copyWith(
                      hintText: Texts.nombre,
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,),
                Expanded(
                  child: TextField(
                    decoration: inputDecoration.copyWith(
                      hintText: Texts.apellido,
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: inputDecoration.copyWith(
                hintText: Texts.correo,
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: inputDecoration.copyWith(
                hintText: Texts.telefono,
                prefixIcon: const Icon(Icons.phone),
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
            TextField(
              decoration: inputDecoration.copyWith(
                hintText: Texts.confirmarContra,
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: blueBlockButton,
              onPressed: () {
                Navigator.pushNamed(context, Routes.continueRegister);
              },
              child: const Text(
                Texts.continuar,
                style: blueButtonText,
              ),
            ),
          ],
        ));
  }
}
