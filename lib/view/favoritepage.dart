import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
        padding: EdgeInsets.fromLTRB(18.0, 15.0, 15.0, 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Favoritos',
            textAlign: TextAlign.start,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
            child: Text(
              '3 produtos salvos',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          buildFavoriteCard(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFwanhUG-eKMSImcDe0q3_O4CSojNvsCvUng&usqp=CAU',
            'Notebook Positivo',
            'Dual Core',
            'R\$ 2.000,00',
          ),
          buildFavoriteCard(
            'https://i.zst.com.br/thumbs/12/10/16/1251501705.jpg',
            'Smartphone Samsung',
            'Novo Usado',
            'R\$ 900,00',
          ),
          buildFavoriteCard(
            'https://i.zst.com.br/thumbs/12/3f/34/929873676.jpg',
            'Smartphone Apple',
            'Iphone 11 64GB iOS Câmera Dupla',
            'R\$ 9999,99',
          ),
        ]),
      ),
    );
  }

  Widget buildFavoriteCard(
    String image,
    String product,
    String description,
    String price,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.0),
      child: Container(
        width: 380,
        height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              width: 150.0,
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
                            overflow: TextOverflow.ellipsis,
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
                        child: Flexible(
                            child: Text(
                          description,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )),
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
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outlined,
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
