import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _gridItens = [
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.phone_iphone_outlined,
            size: 70.0,
          ),
          Text("Telefones", textAlign: TextAlign.center)
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.directions_car_outlined,
            size: 70.0,
          ),
          Text("Carros", textAlign: TextAlign.center)
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.two_wheeler_outlined,
            size: 70.0,
          ),
          Text("Motos", textAlign: TextAlign.center)
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.pedal_bike_outlined,
            size: 70.0,
          ),
          Text("Bicicletas", textAlign: TextAlign.center)
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.sports_esports_outlined,
            size: 70.0,
          ),
          Text("Videogames", textAlign: TextAlign.center)
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.tv_outlined,
            size: 70.0,
          ),
          Text("Televisões", textAlign: TextAlign.center)
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.computer_outlined,
            size: 70.0,
          ),
          Text("Computadores", textAlign: TextAlign.center)
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.headphones_outlined,
            size: 70.0,
          ),
          Text("Headphones", textAlign: TextAlign.center)
        ],
      ),
    ),
    Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.tablet_mac_outlined,
            size: 70.0,
          ),
          Text("Tablets", textAlign: TextAlign.center)
        ],
      ),
    ),
  ];

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(children: [
                  Icon(Icons.place, color: Colors.grey),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Avenida X, 9999. Fortaleza",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.poppins(
                              color: Colors.cyan, fontSize: 16.0))),
                  Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              icon: Icon(Icons.my_location), onPressed: () {})))
                ])),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Busque por produtos, marcas...",
                    labelStyle: GoogleFonts.poppins(color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: 10.0, right: 10, bottom: 10, top: 25.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categorias",
                        style: GoogleFonts.poppins(
                            fontSize: 16.0, fontWeight: FontWeight.w700)),
                    TextButton(
                        style: TextButton.styleFrom(primary: Colors.grey),
                        onPressed: () {},
                        child: Text("Ver Mais",
                            style: GoogleFonts.poppins(fontSize: 13.0)))
                  ],
                )),
            SizedBox(
                height: 450,
                child: GridView.count(
                    crossAxisCount: 3,
                    padding: EdgeInsets.all(10.0),
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: false,
                    children: _gridItens)),
          ],
        ),
      ),
    );
  }
}
