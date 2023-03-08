import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EditVehicleScreen extends StatefulWidget {
  const EditVehicleScreen({Key? key}) : super(key: key);

  @override
  State<EditVehicleScreen> createState() => _EditVehicleScreenState();
}

class _EditVehicleScreenState extends State<EditVehicleScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController placaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: Texts.editarVehiculo,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
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
