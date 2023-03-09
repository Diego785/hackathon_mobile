import 'package:alerta_temprana_scz/home2.dart';
import 'package:alerta_temprana_scz/widget/boton_azul.dart';
import 'package:alerta_temprana_scz/widget/custom_input.dart';
import 'package:alerta_temprana_scz/widget/labels.dart';
import 'package:alerta_temprana_scz/widget/logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /*const Logo(
                  titulo: 'Chat DHV',
                ),*/

                _Form(),
                Container(
                    child: Column(
                  children: [
                    Text(
                      '¿No Tienes cuenta?',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                        minWidth: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        color: Colors.cyan.shade400,
                        hoverColor: Colors.cyan.shade900,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          'Registrate',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {}),
                  ],
                )),
                GestureDetector(
                  child: const Text(
                    'Términos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  ),
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock,
            placeholder: 'Password',
            textController: passCtrl,
            isPassword: true,
          ),

          // TODO: Crear button
          BotonAzul(
            buttonText: 'Ingrese',
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePage2()));
            },
          ),
        ],
      ),
    );
  }
}
