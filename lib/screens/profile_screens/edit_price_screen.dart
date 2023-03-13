import 'package:awason/models/models.dart';
import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EditPriceScreen extends StatefulWidget {
  const EditPriceScreen({Key? key}) : super(key: key);

  @override
  State<EditPriceScreen> createState() => _EditPriceScreenState();
}

class _EditPriceScreenState extends State<EditPriceScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: Texts.editarPrecio,
        ),
        body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<CarrierResponse> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final Carrier carrier = snapshot.data!.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: priceController,
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
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
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          }
        ));
  }
}
