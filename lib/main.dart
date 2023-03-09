import 'package:alerta_temprana_scz/Send%20Notification/form_page.dart';
import 'package:alerta_temprana_scz/pages/login_page.dart';
import 'package:alerta_temprana_scz/pages/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FormularioEmergencia());
  }
}
