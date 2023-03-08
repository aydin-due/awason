import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EditSectorScreen extends StatefulWidget {
  const EditSectorScreen({Key? key}) : super(key: key);

  @override
  State<EditSectorScreen> createState() => _EditSectorScreenState();
}

class _EditSectorScreenState extends State<EditSectorScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: Texts.editarPerfil,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Form(
                key: _formKey,
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
                    ElevatedButton(
                      style: blueBlockButton,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(context);
                        }
                      },
                      child: const Text(
                        Texts.guardar,
                        style: blueButtonText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
