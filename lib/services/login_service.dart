import 'dart:convert';
import 'package:alerta_temprana_scz/models/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginResponse with ChangeNotifier {
  Future login(String $email, String $password) async {
    try {
      final uri = Uri.parse('https://10.0.2.2:8000/login');
      final data = {
        'email': $email,
        'password': $password,
      };

      final resp = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      final loginResponse = loginFromJson(resp.body);
      print(loginResponse.data);
      return loginResponse.data;
    } catch (error) {
      return [];
    }
  }
}
