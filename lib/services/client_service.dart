import 'dart:convert';

import 'package:awason/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClientService extends ChangeNotifier {
  final String baseUrl = 'fuzzy-stockings-boa.cyclic.app';

  Future<ClientResponse> getClient(String id) async {
    final url = Uri.https(baseUrl, '/client/read/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ClientResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get client.');
    }
  }
}