import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';

class ContinueRegisterScreen extends StatelessWidget {
  const ContinueRegisterScreen({Key? key}) : super(key: key);

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
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Container(
                        decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(child: Icon(Icons.arrow_back, color: Colors.white,))))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Image.asset('assets/blue_logo.png'),
              ),
              const SizedBox(height: 20),
              const ContinueRegisterForm(),
            ],
          ),
        ),
      ),
    ));
  }
}

class ContinueRegisterForm extends StatefulWidget {
  const ContinueRegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ContinueRegisterForm> createState() => _ContinueRegisterFormState();
}

class _ContinueRegisterFormState extends State<ContinueRegisterForm> {
  String dropdownvalue = 'Item 1';   
  var items = [    
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              Texts.vehiculo,
              style: subtitle,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              decoration: inputDecoration.copyWith(
                hintText: Texts.modelo,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: inputDecoration.copyWith(
                      hintText: Texts.color,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: inputDecoration.copyWith(
                      hintText: Texts.placa,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              Texts.codigoPostal,
              style: subtitle,
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
              decoration: inputDecoration.copyWith(
                hintText: Texts.codigoPostal,
              ),
              isExpanded: true,
              borderRadius: BorderRadius.circular(10),
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),    
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) { 
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              Texts.precio,
              style: subtitle,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: inputDecoration.copyWith(
                hintText: Texts.precio,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              Texts.precioDescripcion,
              style: plainText,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: blueBlockButton,
              onPressed: () {
                // Navigator.pushNamed(context, Routes.home);
              },
              child: const Text(
                Texts.registrarme,
                style: blueButtonText,
              ),
            ),
          ],
        ));
  }
}
