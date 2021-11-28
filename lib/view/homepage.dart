import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Image.asset("assets/logo.png"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(Icons.place, color: Colors.grey),
            Text("Avenida X, 9999. Fortaleza",
                style: GoogleFonts.poppins(color: Colors.cyan, fontSize: 11.0)),
            IconButton(icon: Icon(Icons.my_location), onPressed: () {})
          ]),
        ],
      ),
    );
  }
}
