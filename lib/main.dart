import 'package:alerta_temprana_scz/pages/show_alerts/implementation_cards/ui/contact_list_page.dart';
import 'package:alerta_temprana_scz/pages/show_alerts/implementation_cards/ui/widgets/cards.dart';
import 'package:alerta_temprana_scz/home.dart';
import 'package:alerta_temprana_scz/home2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: const MainPage()));
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<double> distances = [];
    return  HomePage2();
  }
}


