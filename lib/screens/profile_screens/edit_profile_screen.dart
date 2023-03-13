import 'package:awason/models/models.dart';
import 'package:awason/services/services.dart';
import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  updateDetails() async {
    final apiService = ApiService();
    final carrier = Carrier(
        nombre: nameController.text,
        apellidos: surnameController.text,
        email: emailController.text,
        numContacto: int.parse(phoneController.text));
    final CarrierResponse response = await apiService.updateDetails(carrier);
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
    final carrier = ModalRoute.of(context)!.settings.arguments as Carrier;
    nameController.text = carrier.nombre ?? '';
    surnameController.text = carrier.apellidos ?? '';
    emailController.text = carrier.email ?? '';
    phoneController.text = carrier.numContacto.toString();
    return Scaffold(
        appBar: const CustomAppBar(
          title: Texts.editarPerfil,
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
                    ],
                  ),
                ),
                ElevatedButton(
                  style: blueBlockButton,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      updateDetails();
                    }
                  },
                  child: const Text(
                    Texts.guardar,
                    style: blueButtonText,
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ));
  }
}
