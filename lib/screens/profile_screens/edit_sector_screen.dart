import 'package:awason/utils/utils.dart';
import 'package:awason/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EditSectorScreen extends StatefulWidget {
  const EditSectorScreen({Key? key}) : super(key: key);

  @override
  State<EditSectorScreen> createState() => _EditSectorScreenState();
}

class _EditSectorScreenState extends State<EditSectorScreen> {
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
    return Scaffold(
        appBar: const CustomAppBar(
          title: Texts.editarSector,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Column(
                children: [
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
                  ElevatedButton(
                    style: blueBlockButton,
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      Texts.guardar,
                      style: blueButtonText,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
