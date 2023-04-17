import 'dart:convert';
import 'dart:io';

import 'package:awason/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class OrderService extends ChangeNotifier {
  final storage = const FlutterSecureStorage();
  final String baseUrl = 'fuzzy-stockings-boa.cyclic.app';

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
}