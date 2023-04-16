import 'dart:convert';

import 'package:awason/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class OrderRequestService extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  final String baseUrl = 'fuzzy-stockings-boa.cyclic.app';

  // Future<OrderRequestResponse> createOrderRequest(OrderRequest orderRequest) async {
  //   final Map<String, dynamic> body = {
  //     'idCarrier': orderRequest.idCarrier,
  //     'idClient': orderRequest.idClient,
  //     'idDireccion': orderRequest.idDireccion,
  //     'idVehiculo': orderRequest.idVehiculo,
  //     'idHorario': orderRequest.idHorario,
  //     'cantidadGarrafones': orderRequest.cantidadGarrafones,
  //     'precioTotal': orderRequest.precioTotal,
  //     'fecha': orderRequest.fecha,
  //     'hora': orderRequest.hora,
  //     'estado': orderRequest.estado,
  //   };
  //   final url = Uri.https(baseUrl, '/orderRequest/create');
  //   final response = await http.post(url, body: json.encode(body), headers: {
  //     HttpHeaders.contentTypeHeader: 'application/json',
  //   });
  //   if (response.statusCode == 200) {
  //     return OrderRequestResponse.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to create order request.');
  //   }
  // }

  Future<OrderRequestResponse> getOrderRequest() async {
    final url = Uri.https(baseUrl, '/order/pending');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return OrderRequestResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get order request.');
    }
  }

  Future<GenericResponse> declineRequest(String id) async {
    final url = Uri.https(baseUrl, '/order/$id/decline-request');
    final response = await http.put(url);
    if (response.statusCode == 200) {
      return GenericResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to decline order request.');
    }
  }

  Future<GenericResponse> acceptRequest({required String order}) async {
    final id = await storage.read(key: 'user');
    final Map<String, dynamic> body = {
      'carrier': id,
    };
    final url = Uri.https(baseUrl, '/order/$order/accept-request');
    final response = await http.put(url, body: json.encode(body), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      return GenericResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to accept order request.');
    }
  }

  // Future<OrderRequestResponse> updateOrderRequest(OrderRequest orderRequest) async {
  //   final Map<String, dynamic> body = {
  //     'idCarrier': orderRequest.idCarrier,
  //     'idClient': orderRequest.idClient,
  //     'idDireccion': orderRequest.idDireccion,
  //     'idVehiculo': orderRequest.idVehiculo,
  //     'idHorario': orderRequest.idHorario,
  //     'cantidadGarrafones': orderRequest.cantidadGarrafones,
  //     'precioTotal': orderRequest.precioTotal,
  //     'fecha': orderRequest.fecha,
  //     'hora': orderRequest.hora,
  //     'estado': orderRequest.estado,
  //   };
    // final url = Uri.https(baseUrl, '/orderRequest/update/${orderRequest.id
}