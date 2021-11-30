import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class mydatapage extends StatefulWidget {
  const mydatapage({Key? key}) : super(key: key);

  @override
  _mydatapage createState() => _mydatapage();
}

class _mydatapage extends State<mydatapage> {
  double? width;
  double? height;
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Container(
              height: 52, width: 65, child: Image.asset("assets/logo.png")),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 15.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 5.0,
                    left: 5.0,
                  ),
                  child: Text(
                    "Meus dados",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                    )),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      bottom: 28.0,
                      top: 15.0,
                      left: 5.0,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            child: Icon(
                              Icons.account_circle_outlined,
                              size: 100.0,
                            ),
                          )
                        ])),
                newRow("Nome", "Adauto Moisés"),
                newRow("Email", "adautomaleandro@gmail.com"),
                newRow("CPF", "085.149.961-83"),
                newRow("Telefone", "(85) 98701-5362"),
              ]),
        ));
  }

  newRow(String Principal, String Secundario) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 5.0,
              left: 5.0,
            ),
            child: Text(
              "$Principal",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              )),
            )),
        Padding(
            padding: EdgeInsets.only(
              bottom: 10.0,
              left: 5.0,
            ),
            child: Text(
              "$Secundario",
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.w400,
                fontSize: 13.0,
              )),
            )),
      ],
    );
  }
}
