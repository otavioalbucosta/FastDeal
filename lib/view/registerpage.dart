import 'dart:ui';
import 'package:fast_deal/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double? width;
  double? height;
  bool _isObscure = true;

  TextEditingController _login = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();

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
              child: buildTextField("Nome de Usuário *", _login),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 13.0),
              child: buildTextField("Senha *", _password, isPassword: true),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 13.0),
              child: buildTextField("Confirmar Senha *", _confirmPassword,
                  isPassword: true),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 13.0),
              child: buildTextField("E-mail *", _email,
                  type: TextInputType.emailAddress),
            ),
            Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 50.0),
                child: buildTextField("Número de Telefone", _phone,
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
                    onPressed: () async {
                      if (_login.text != "" &&
                          _password.text != "" &&
                          _confirmPassword.text != "" &&
                          _email.text != "" &&
                          _phone.text != "" &&
                          _password.text == _confirmPassword.text) {
                      } else {
                        String hashSenha =
                            md5.convert(utf8.encode(_password.text)).toString();
                        Usuario user = Usuario();
                        user.nome = _login.text;
                        user.hashSenha = hashSenha;
                        user.email = _email.text;
                        user.telefone = _phone.text;
                        print(await user.saveUsuario());
                        Navigator.pop(context);
                      }
                    },
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

  Widget buildTextField(String label, TextEditingController controller,
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
