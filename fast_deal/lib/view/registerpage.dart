import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? width;
    double? height;

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
              child: buildTextField("Senha *"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 13.0),
              child: buildTextField("Confirmar Senha *"),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 13.0),
              child: buildTextField("E-mail *"),
            ),
            Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 50.0),
                child: TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      labelText: "Número de Telefone",
                      labelStyle: GoogleFonts.poppins(fontSize: 16.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                  keyboardType: TextInputType.number,
                )),
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
}

Widget buildTextField(String label) {
  return TextField(
    textAlign: TextAlign.start,
    decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(fontSize: 16.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
  );
}
