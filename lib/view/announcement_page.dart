import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  _AnnouncementPageState createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Meus Anúncios',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 0.1,
              thickness: 0.25,
              color: Colors.grey[600],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
              child: Column(
                children: [
                  buildCard(
                      'https://images-submarino.b2w.io/produtos/01/00/img/1611315/9/1611315984_1GG.jpg',
                      'Smartphone Apple',
                      'Iphone 11 64GB iOS Câmera Dupla',
                      'R\$ 9999,99',
                      'Ativo'),
                  buildCard(
                      'https://images-submarino.b2w.io/produtos/131813722/imagens/fogao-consul-5-bocas-acendimento-automatico-cfs5nar/131813722_1_large.jpg',
                      'Fogão CONSUL',
                      '5 Bocas',
                      'R\$ 2000,00',
                      'Pendente'),
                  buildCard(
                      'https://www.cabralmotor.com.br/wp-content/uploads/CARGO_2022_34_F.png',
                      'Honda CG 160 Cargo',
                      'A melhor das CG para se trabalhar com entregas.',
                      'R\$ 13.785,00',
                      'Expirado'),
                  SizedBox(
                    width: 130,
                    height: 70,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Anunciar',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.cyanAccent),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String image, String product, String description,
      String price, String status) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.0),
      child: Container(
        width: 380,
        height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              width: 170.0,
              height: 300.0,
              image: NetworkImage(image),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 15.0, bottom: 17.0),
                          child: Text(
                            product,
                            style: GoogleFonts.cabin(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(bottom: 17.0),
                        child: Text(
                          description,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 25.0),
                        child: Text(
                          price,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 27.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        status,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_outlined,
                color: Colors.black,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ]),
      ),
    );
  }
}
