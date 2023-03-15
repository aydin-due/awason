import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  Future logout() async {
    await storage.delete(key: 'user');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'user') ?? ''; 
  }
}
