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

// _launchURL() async {
//   const url =
//       'diegohurtado2412@gmail.com?subject=Testing&body=MyNewNotificationTesting';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

class _HomePage2State extends State<HomePage2> {
  static const IconData copyright =
      IconData(0xe198, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      // ItemBoton(
      //   FontAwesomeIcons.box,
      //   'Inventario',
      //   Color(0xff6989F5),
      //   Color(0xff906EF5),
      //   () {},
      // ),
      ItemBoton(
        Icons.notification_add,
        'Enviar Alerta',
        Colors.yellow.shade700,
        Colors.yellowAccent,
        () {},
      ),
      // ItemBoton(
      //   FontAwesomeIcons.hospitalUser,
      //   'Pacientes',
      //   Color(0xffF2D572),
      //   Color(0xffE06AA3),
      //   () {},
      // ),
      // ItemBoton(
      //   FontAwesomeIcons.userGroup,
      //   'Proveedores',
      //   Color(0xff317183),
      //   Color(0xff46997D),
      //   () {},
      // ),
      // ItemBoton(
      //   FontAwesomeIcons.receipt,
      //   'Receta Electr??nica',
      //   Color(0xff6989F5),
      //   Color(0xff906EF5),
      //   () {},
      // ),
      ItemBoton(FontAwesomeIcons.warning, 'Mostrar Alertas', Colors.red,
          Colors.orangeAccent, () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (_) => MicrosListPage(distances)));
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => CategoriesPage()));
      }),
      ItemBoton(
        FontAwesomeIcons.whatsapp,
        'Cont??ctate con nostros con un toque',
        Colors.green.shade700,
        Colors.green.shade400,
        () {},
      ),
      ItemBoton(
        Icons.mail,
        'Difundir',
        Colors.grey.shade800,
        Colors.grey.shade400,
        () {},
      ),
      // new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
      //     Color(0xff46997D)),
      // new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
      //     Color(0xff6989F5), Color(0xff906EF5)),
      // new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
      //     Color(0xff66A9F2), Color(0xff536CF6)),
      // new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
      //     Color(0xffF2D572), Color(0xffE06AA3)),
      // new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
      //     Color(0xff46997D)),
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
            margin: EdgeInsets.only(top: 100),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height -800,
                ),
                ...itemMap,
                Center(child: Text("Emergencias Gobernaci??n: 800148139")),
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
//       titulo: 'Asistencia M??dica',
//       color1: Color(0xff526BF6),
//       color2: Color(0xff67ACF2),
//     );
//   }
//}
