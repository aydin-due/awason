import 'dart:convert';
import 'package:awason/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiService extends ChangeNotifier {
  final String baseUrl = 'https://fuzzy-stockings-boa.cyclic.app';

  Future<CarrierResponse> createCarrier(Carrier carrier) async {
    print(carrier.nombre);
    print(carrier.apellidos);
    print(carrier.email);
    print(carrier.contrasena);
    print(carrier.numContacto);
    print(carrier.precioGarrafon);
    print(carrier.vehiculo!.matricula);
    print(carrier.vehiculo!.marca);
    print(carrier.vehiculo!.modelo);
    print(carrier.vehiculo!.color);
    final Map<String, dynamic> body = {
      'nombre': carrier.nombre,
      'apellidos': carrier.apellidos,
      'email': carrier.email,
      'contrasena': carrier.contrasena,
      'num_contacto': carrier.numContacto,
      'precioGarrafon': carrier.precioGarrafon,
      'matricula': carrier.vehiculo!.matricula,
      'marca': carrier.vehiculo!.marca,
      'modelo': carrier.vehiculo!.modelo,
      'color': carrier.vehiculo!.color,
    };
    final response = await http.post(
      Uri.parse('$baseUrl/carrier/signup'),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return CarrierResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create carrier.');
    }
  }

  Future<CarrierResponse> getCarrier(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/carrier/read/$id'),
    );
    if (response.statusCode == 200) {
      return CarrierResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get carrier.');
    }
  }
}
