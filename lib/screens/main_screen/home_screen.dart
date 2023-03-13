import 'package:awason/models/models.dart';
import 'package:awason/services/api_service.dart';
import 'package:awason/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final storage = const FlutterSecureStorage();
  final ApiService _apiService = ApiService();
  bool isActive = false;

  updateStatus(bool status) async {
    final GenericResponse response = await _apiService.updateStatus(status);
    SnackBar snackBar = SnackBar(content: Text(response.message!));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    setState(() {
      isActive = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _apiService.getCarrier(),
        builder:
            (BuildContext context, AsyncSnapshot<CarrierResponse> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final Carrier carrier = snapshot.data!.data!;
          isActive = carrier.isActive!;
          return Column(
            children: [
              Card(
                  shape: cardDecor,
                  elevation: 0,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Text(isActive ? Texts.activo : Texts.inactivo,
                            style: cardText),
                        const Spacer(),
                        Switch.adaptive(
                          value: isActive,
                          onChanged: (value) => updateStatus(value),
                        )
                      ],
                    ),
                  ))
            ],
          );
        });
  }
}
