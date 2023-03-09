import 'package:alerta_temprana_scz/Send%20Notification/form_page.dart';
import 'package:alerta_temprana_scz/pages/show_alerts/implementation_cards/ui/contact_list_page.dart';
import 'package:alerta_temprana_scz/pages/show_alerts/show_categories.dart';
import 'package:alerta_temprana_scz/widgets/boton_gordo.dart';
import 'package:alerta_temprana_scz/widgets/headers.dart';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final void Function()? onTap;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2, this.onTap);
}

class HomePage2 extends StatefulWidget {
  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  static const IconData copyright =
      IconData(0xe198, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      ItemBoton(Icons.notification_add, 'Enviar Alertas', Color(0xff66A9F2),
          Color(0xff536CF6), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => FormularioEmergencia()));
      }),
      ItemBoton(FontAwesomeIcons.warning, 'Mostrar Alertas', Colors.red,
          Colors.orangeAccent, () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (_) => MicrosListPage(distances)));
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => CategoriesPage()));
      }),
      ItemBoton(
        FontAwesomeIcons.whatsapp,
        'Contáctate con nostros con un toque',
        Colors.green.shade700,
        Colors.green.shade400,
        () {},
      ),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              duration: Duration(milliseconds: 250),
              child: BotonGordo(
                icon: item.icon,
                texto: item.texto,
                color1: item.color1,
                color2: item.color2,
                onPress: item.onTap,
              ),
            ))
        .toList();

    return Scaffold(
      // backgroundColor: Colors.red,
      body: Stack(
        children: [
          _Encabezado(),
          Container(
            margin: EdgeInsets.only(top: 200),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3,
                ),
                ...itemMap,
                Center(child: Text("Emergencias Gobernación: 800148139")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 220,
                        child: Icon(
                            IconData(0xe198, fontFamily: 'MaterialIcons'))),
                    Text("Solution "),
                    FaIcon(FontAwesomeIcons.heart)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "MainButton",
        backgroundColor: Colors.green.shade900,
        child: Icon(Icons.call),
        onPressed: () {
          // socketService.emit('emitir-mensaje',
          //     {'nombre': 'Flutter', 'mensaje': 'Hola desde Flutter'});
          // Navigator.pushNamed(context, 'usuarios');
        },
      ),
    );
  }
}

class _Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Stack(
            children: [
              IconHeader(
                titulo: 'Alerta Temprana SCZ',
                logo: 'imgs/escudo_scz.png',
                logo2: 'imgs/escudo_scz2.png',
                color1: Color.fromARGB(255, 49, 184, 31),
                color2: Color.fromARGB(255, 189, 255, 172),
                grosor: MediaQuery.of(context).size.height / 2,
              ),
            ],
          ),
          Positioned(
              right: 0,
              top: 45,
              child: RawMaterialButton(
                  onPressed: () {},
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15.0),
                  child:
                      FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white)))
        ],
      ),
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      icon: FontAwesomeIcons.carCrash,
      texto: 'Motor Accident',
      color1: Color(0xff6989F5),
      color2: Color(0xff906EF5),
      onPress: () {
        print('Click!');
      },
    );
  }
}

// class PageHeader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return IconHeader(
//       icon: FontAwesomeIcons.plus,
//       titulo: 'Asistencia Médica',
//       color1: Color(0xff526BF6),
//       color2: Color(0xff67ACF2),
//     );
//   }
//}
