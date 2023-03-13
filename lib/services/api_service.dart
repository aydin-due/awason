import 'dart:convert';
import 'dart:io';
import 'package:awason/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class ApiService extends ChangeNotifier {
  final String baseUrl = 'fuzzy-stockings-boa.cyclic.app';
  final storage = const FlutterSecureStorage();
  final String testId = '640cfe856782171c79344a10';

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
    final url = Uri.https(baseUrl, '/carrier/signup');
    final response = await http.post(url, body: json.encode(body), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      return CarrierResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create carrier.');
    }
  }

  Future<CarrierResponse> getCarrier() async {
    final id = await storage.read(key: 'user');
    final url = Uri.https(baseUrl, '/carrier/read/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return CarrierResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get carrier.');
    }
  }

  Future<GenericResponse> updateStatus(bool status) async {
    final id = await storage.read(key: 'user');
    final Map<String, bool> body = {
      'isActive': status,
    };
    final url = Uri.https(baseUrl, '/carrier/updateStatus/$id');
    final response = await http.put(url, body: json.encode(body), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      return GenericResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create carrier.');
    }
  }
}
