import 'package:awason/models/models.dart';
import 'package:awason/services/services.dart';
import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
              const Text(
                Texts.subtitleRegister,
                style: subtitle,
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

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController marcaController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController placaController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final List _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  int currentStep = 0;
  final ApiService _apiService = ApiService();
  final storage = const FlutterSecureStorage();

  createCarrier() async {
    final carrier = Carrier(
        nombre: nameController.text,
        apellidos: surnameController.text,
        email: emailController.text,
        numContacto: int.parse(phoneController.text),
        contrasena: passwordController.text,
        balance: 0,
        calificacion: 0,
        precioGarrafon: int.parse(priceController.text),
        vehiculo: Vehiculo(
            marca: marcaController.text,
            modelo: modelController.text,
            color: colorController.text,
            matricula: placaController.text));
    final CarrierResponse response = await _apiService.createCarrier(carrier);
    if (context.mounted) {
      if (response.status == Texts.success) {
        storage.write(key: 'user', value: response.data!.sId);
        Navigator.pushNamed(context, Routes.home);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response.message ?? 'Error'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
        physics: const NeverScrollableScrollPhysics(),
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: <Widget>[
                ElevatedButton(
                    style: blueButton,
                    onPressed: () {
                      if (_formKeys[currentStep].currentState!.validate()) {
                        currentStep == 2
                            ? createCarrier()
                            : details.onStepContinue!();
                      }
                    },
                    child: const Text(
                      Texts.continuar,
                      style: blueButtonText,
                    )),
                TextButton(
                  onPressed: details.onStepCancel,
                  child: const Text(
                    Texts.cancelar,
                    style: grayText,
                  ),
                ),
              ],
            ),
          );
        },
        margin: const EdgeInsets.only(left: 50, right: 20),
        currentStep: currentStep,
        onStepContinue: () {
          setState(() {
            if (currentStep < 2) {
              currentStep++;
            } else {
              currentStep = 0;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (currentStep > 0) {
              currentStep--;
            } else {
              currentStep = 0;
            }
          });
        },
        onStepTapped: (step) {
          setState(() {
            currentStep = step;
          });
        },
        steps: [
          _step1(),
          _step2(),
          _step4(),
        ]);
  }

  Step _step4() {
    return Step(
        title: const Text(Texts.step4),
        content: Form(
          key: _formKeys[2],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: priceController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: inputDecoration.copyWith(
                  hintText: Texts.precio,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Texts.campoRequerido;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                Texts.precioDescripcion,
                style: plainText,
              ),
            ],
          ),
        ),
        isActive: currentStep >= 2);
  }

  Step _step2() {
    return Step(
        title: const Text(Texts.step2),
        content: Form(
          key: _formKeys[1],
          child: Column(
            children: [
              TextFormField(
                controller: marcaController,
                decoration: inputDecoration.copyWith(
                  hintText: Texts.marca,
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
              TextFormField(
                controller: modelController,
                decoration: inputDecoration.copyWith(
                  hintText: Texts.modelo,
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
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: colorController,
                      decoration: inputDecoration.copyWith(
                        hintText: Texts.color,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return Texts.campoRequerido;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: placaController,
                      decoration: inputDecoration.copyWith(
                        hintText: Texts.placa,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return Texts.campoRequerido;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        isActive: currentStep >= 1);
  }

  Step _step1() {
    return Step(
        title: const Text(Texts.step1),
        content: Form(
          key: _formKeys[0],
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: nameController,
                      decoration: inputDecoration.copyWith(
                        hintText: Texts.nombre,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return Texts.campoRequerido;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: surnameController,
                      decoration: inputDecoration.copyWith(
                        hintText: Texts.apellido,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return Texts.campoRequerido;
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: inputDecoration.copyWith(
                  hintText: Texts.correo,
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
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: inputDecoration.copyWith(
                  hintText: Texts.telefono,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Texts.campoRequerido;
                  }
                  if (value.length < 10) {
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
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Texts.campoRequerido;
                  }
                  if (confirmPasswordController.text != value) {
                    return Texts.contrasenasNoCoinciden;
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: inputDecoration.copyWith(
                  hintText: Texts.confirmarContra,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Texts.campoRequerido;
                  }
                  if (passwordController.text != value) {
                    return Texts.contrasenasNoCoinciden;
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        isActive: currentStep >= 0);
  }
}
