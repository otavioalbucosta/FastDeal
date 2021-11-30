import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(color: Colors.black),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outlined,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share_outlined,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                color: Colors.black,
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: 230,
                  width: 260,
                  child: Image(
                    image: AssetImage("assets/ProductPage.png"),
                  )),
              Divider(
                height: 0.1,
                thickness: 0.25,
                color: Colors.grey[600],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 25.0),
                      child: Text(
                        'Smartphone Apple',
                        style: GoogleFonts.cabin(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'R\$ 19999,99',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'R\$  9999,99',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 60.0),
                      child: ExpansionTile(
                        title: Text(
                          'Descrição',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              'Iphone 11 64GB iOS Câmera Dupla',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 7.0, 0.0),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.local_shipping_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Exemplo: 60040-531",
                              labelStyle: GoogleFonts.poppins(fontSize: 16.0),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 90.0),
                            child: TextButton(
                                onPressed: () {},
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        15.0, 5.0, 15.0, 5.0),
                                    child: Text('Calcular',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w400),
                                        ))),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color: Colors.cyan))))))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child: Text(
                        'Contatos',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.0, top: 15.0),
                      child: Row(children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.call_outlined,
                            color: Colors.black,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "(85) 0 0000-0000",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
