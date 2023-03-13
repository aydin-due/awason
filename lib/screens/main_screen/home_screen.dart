import 'package:awason/models/responses/carrier_response.dart';
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

  Future<CarrierResponse> getUserData() async {
    // final String id = await storage.read(key: 'user') ?? '';
    const String id = '640cfe856782171c79344a10';
    return _apiService.getCarrier(id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserData(),
        builder:
            (BuildContext context, AsyncSnapshot<CarrierResponse> snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          final CarrierResponse carrier = snapshot.data!;
          isActive = carrier.data!.isActive!;
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
                          onChanged: (value) {
                            setState(() {
                              isActive = value;
                            });
                          },
                        )
                      ],
                    ),
                  ))
            ],
          );
        });
  }
}
