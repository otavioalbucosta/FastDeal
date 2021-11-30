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
        leading: BackButton(
            color: Colors.black
        ),
        backgroundColor: Colors.white,),
        body: SingleChildScrollView(
      padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 5.0, left: 5.0,),
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
                padding: EdgeInsets.only(bottom: 28.0, left: 5.0,),
                child: GestureDetector(
                  child: Icon(Icons.account_circle, size: 100.0),
                ),
            ),
            newRow("Nome", "Adauto"),
            newRow("Email", "adauto@gmail.com"),
            newRow("CPF", "085.149.961-83"),
            newRow("Telefone", "(85) 98701-5362"),





          ]),
    ));
  }

  newRow(String Principal, String Secundario ){
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 0.0, left: 5.0,),
            child: Text(
              "$Principal",
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  )),

            )
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 5.0, left: 5.0,),
            child: Text(
              "$Secundario",
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  )),

            )
        ),

      ],
    );

  }

}
