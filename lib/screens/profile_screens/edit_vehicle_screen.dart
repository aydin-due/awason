import 'package:awason/models/responses/generic_response.dart';
import 'package:awason/models/vehiculo.dart';
import 'package:awason/services/services.dart';
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
  final TextEditingController marcaController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController placaController = TextEditingController();

  updateVehicle() async {
    final apiService = CarrierService();
    final vehicle = Vehiculo(
      marca: marcaController.text,
        modelo: modelController.text,
        color: colorController.text,
        matricula: placaController.text);
    final GenericResponse response = await apiService.updateVehicle(vehicle);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(response.message ?? ''),
        ),
      );
      if (response.status == Texts.success) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final vehicle = ModalRoute.of(context)!.settings.arguments as Vehiculo;
    marcaController.text = vehicle.marca ?? '';
    modelController.text = vehicle.modelo ?? '';
    colorController.text = vehicle.color ?? '';
    placaController.text = vehicle.matricula ?? '';

    return Scaffold(
        appBar: const CustomAppBar(
          title: Texts.editarVehiculo,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
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
                ElevatedButton(
                  style: blueBlockButton,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      updateVehicle();
                    }
                  },
                  child: const Text(
                    Texts.guardar,
                    style: blueButtonText,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
