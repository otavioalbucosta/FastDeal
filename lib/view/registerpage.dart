import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double? width;
  double? height;
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 35.0, bottom: 5.0),
              child: Text(
                "CADASTRO",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: Colors.cyan,
                  fontSize: 24.0,
                )),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 28.0),
                child: Text(
                  "Olá, bem-vindo ao Fast Deal, por\n favor, cadastre sua conta.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 16.0),
                )),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 13.0, top: 14.0),
              child: buildTextField("Nome de Usuário *"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 13.0),
              child: buildTextField("Senha *", isPassword: true),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 13.0),
              child: buildTextField("Confirmar Senha *", isPassword: true),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 13.0),
              child:
                  buildTextField("E-mail *", type: TextInputType.emailAddress),
            ),
            Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 50.0),
                child: buildTextField("Número de Telefone",
                    type: TextInputType.phone)),
            GestureDetector(
              child: Center(
                child: Ink(
                  width: 50.0,
                  height: 50.0,
                  decoration: const ShapeDecoration(
                    color: Colors.black12,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.done, size: 30.0),
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.0, bottom: 5.0),
              child: Text(
                "Já possui uma conta?",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 16.0,
                )),
              ),
            ),
            GestureDetector(
                onTap: () {
                  {
                    Navigator.pop(context);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                  child: Text(
                    "Entre",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.cyan,
                      fontSize: 16.0,
                    )),
                  ),
                ))
          ]),
    ));
  }

  Widget buildTextField(String label,
      {TextInputType type = TextInputType.text, bool isPassword = false}) {
    if (isPassword) {
      return TextField(
        keyboardType: type,
        obscureText: _isObscure,
        enableSuggestions: false,
        autocorrect: false,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: GoogleFonts.poppins(fontSize: 16.0),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
      );
    } else {
      return TextField(
        keyboardType: type,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: GoogleFonts.poppins(fontSize: 16.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
      );
    }
  }
}
