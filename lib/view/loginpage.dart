import 'dart:ui';
import 'package:fast_deal/view/mainpage.dart';
import 'package:fast_deal/view/registerpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:fast_deal/model/user.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:fast_deal/model/database_helper.dart';

class LoginPage extends StatelessWidget {
  DatabaseHelper helper = DatabaseHelper();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController loginController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                height: 103,
                width: 129,
                child: Image(
                  image: AssetImage("assets/logo.png"),
                )),
            Padding(
              padding: EdgeInsets.only(top: 35.0, bottom: 5.0),
              child: Text(
                "ENTRAR",
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
                  "Olá, bem-vindo ao Fast Deal, por\n favor, entre com sua conta.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 16.0),
                )),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, bottom: 27.0, top: 30.0),
              child: TextField(
                controller: loginController,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    labelText: "Login",
                    labelStyle: GoogleFonts.poppins(fontSize: 16.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 100.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: GoogleFonts.poppins(fontSize: 16.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ),
            ),
            Ink(
              width: 50.0,
              height: 50.0,
              decoration: const ShapeDecoration(
                color: Colors.black12,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.login, size: 30.0),
                color: Colors.black,
                onPressed: () async {
                  String passwordHash = md5
                      .convert(utf8.encode(passwordController.text))
                      .toString();
                  Usuario? user =
                      await Usuario.getUsuario(loginController.text);

                  if (user!.nome == loginController.text &&
                      user.hashSenha == passwordHash) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainPage(user: user)),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 120.0, bottom: 5.0),
              child: Text(
                "Não possui uma conta?",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontSize: 16.0,
                )),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                  child: Text(
                    "Cadastre-se",
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
