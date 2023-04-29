import 'dart:convert';
import 'dart:io';
import 'package:awason/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class CarrierService extends ChangeNotifier {
  final String baseUrl = 'fuzzy-stockings-boa.cyclic.app';
  final storage = const FlutterSecureStorage();
  final String testId = '640eadfd61b2786edd462911';

  Future<CarrierResponse> createCarrier(Carrier carrier) async {
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

  Future<CarrierResponse> updateDetails(Carrier carrier) async {
    final id = await storage.read(key: 'user');
    final Map<String, dynamic> body = {
      'nombre': carrier.nombre,
      'apellidos': carrier.apellidos,
      'email': carrier.email,
      'num_contacto': carrier.numContacto
    };
    final url = Uri.https(baseUrl, '/carrier/update/$id');
    final response = await http.put(url, body: json.encode(body), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      return CarrierResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create carrier.');
    }
  }

  Future<GenericResponse> updateVehicle(Vehiculo vehiculo) async {
    final id = await storage.read(key: 'user');
    final url = Uri.https(baseUrl, '/carrier/updateVehiculo/$id');
    final Map<String, dynamic> body = {
      'vehiculo': vehiculo.toJson(),
    };
    final response = await http.put(url, body: json.encode(body), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      return GenericResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create carrier.');
    }
  }

  Future<CarrierResponse> updatePrice(String price) async {
    final id = await storage.read(key: 'user');
    final url = Uri.https(baseUrl, '/carrier/$id/updatePrecioGarrafon');
    final Map<String, dynamic> body = {
      'precioGarrafon': price,
    };
    final response = await http.put(url, body: json.encode(body), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      return CarrierResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create carrier.');
    }
  }

  Future<CarriersResponse> login(String email, String password) async {
    final url = Uri.https(baseUrl, '/carrier/signin');
    final Map<String, dynamic> body = {
      'email': email,
      'contrasena': password,
    };
    final response = await http.post(url, body: json.encode(body), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    if (response.statusCode == 200) {
      return CarriersResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create carrier.');
    }
  }

  Future<OrdersResponse> getOngoingOrders() async {
    final id = await storage.read(key: 'user');
    final url = Uri.https(baseUrl, '/order/ongoing/$id');

    final response = await http.get(url);
    final decodedRes = OrdersResponse.fromJson(jsonDecode(response.body));

    if (decodedRes.status == "FAILED") {
      throw Exception(decodedRes.message);
    }

    return decodedRes;
  }

  Future<OrderResponse> finishDelivery(String orderId) async {
    final url = Uri.https(baseUrl, '/order/$orderId/finish-delivery');

    final response = await http.put(url, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    final decodedRes = OrderResponse.fromJson(jsonDecode(response.body));

    if (decodedRes.status == "FAILED") {
      throw Exception(decodedRes.message);
    }

    return decodedRes;
  }

  Future<OrderResponse> cancelDelivery(String orderId) async {
    final url = Uri.https(baseUrl, '/order/$orderId/cancel-delivery');

    final response = await http.put(url, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    final decodedRes = OrderResponse.fromJson(jsonDecode(response.body));

    if (decodedRes.status == "FAILED") {
      throw Exception(decodedRes.message);
    }

    return decodedRes;
  }

  Future<HomeScreenResponse> getHomeData() async {
    final id = await storage.read(key: 'user');
    final url = Uri.https(baseUrl, '/carrier/home/$id');

    final response = await http.get(url);
    final decodedRes = HomeScreenResponse.fromJson(jsonDecode(response.body));

    if (decodedRes.status == "FAILED") {
      throw Exception(decodedRes.message);
    }

    return decodedRes;
  }
}
