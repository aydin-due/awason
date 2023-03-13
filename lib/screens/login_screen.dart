import 'package:awason/models/models.dart';
import 'package:awason/models/responses/carrier_response.dart';
import 'package:awason/services/services.dart';
import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Image.asset('assets/blue_logo.png'),
              ),
              const Text(
                Texts.subtitleLogin,
                style: subtitle,
              ),
              const SizedBox(
                height: 20,
              ),
              const LoginForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    Texts.noTienesCuenta,
                    style: plainText,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.register);
                    },
                    child: const Text(
                      Texts.registrate,
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

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  login() async {
    const storage = FlutterSecureStorage();
    final apiService = ApiService();
    final CarriersResponse response =
        await apiService.login(emailController.text, passwordController.text);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message ?? ''),
        ),
      );
      if (response.status == Texts.success) {
        storage.write(key: 'user', value: response.data![0].sId);
        Navigator.pushReplacementNamed(context, Routes.home);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: inputDecoration.copyWith(
                  hintText: Texts.correo,
                  prefixIcon: const Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Texts.campoRequerido;
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return Texts.campoInvalido;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: inputDecoration.copyWith(
                  hintText: Texts.contra,
                  prefixIcon: const Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Texts.campoRequerido;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: blueBlockButton,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    login();
                  }
                },
                child: const Text(
                  Texts.entrar,
                  style: blueButtonText,
                ),
              ),
            ],
          ),
        ));
  }
}
