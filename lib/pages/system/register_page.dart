import 'package:alerta_temprana_scz/widget/boton_azul.dart';
import 'package:alerta_temprana_scz/widget/custom_input.dart';
import 'package:alerta_temprana_scz/widget/labels.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Form(),
                Container(
                    child: Column(
                  children: [
                    Text(
                      '¿Ya tienes Cuenta?',
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
                          'Inicia sesion aqui',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {}),
                  ],
                )),
                GestureDetector(
                  child: Text(
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
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final numCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 38),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity_rounded,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),
          CustomInput(
            icon: Icons.mail,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.numbers,
            placeholder: 'Telefono',
            keyboardType: TextInputType.number,
            textController: numCtrl,
          ),
          CustomInput(
            icon: Icons.lock,
            placeholder: 'Password',
            textController: passCtrl,
            isPassword: true,
          ),
          // TODO: Crear button
          BotonAzul(buttonText: 'Ingrese', onPressed: () {}),
        ],
      ),
    );
  }
}
