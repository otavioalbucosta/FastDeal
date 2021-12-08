import 'package:flutter/material.dart';
import 'dart:io';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List _products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(itemBuilder: _buildCard));
  }

  Widget _buildCard(BuildContext context, int index) {
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Row(
              children: [
                Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: _products[index].imagem != null
                              ? FileImage(File(_products[index].imagem ?? ""))
                              : AssetImage("images/person.png")
                                  as ImageProvider)),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _products[index].nome ?? "",
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _products[index].email ?? "",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          _products[index].telefone ?? "",
                          style: TextStyle(fontSize: 18.0),
                        )
                      ],
                    ))
              ],
            ),
          )),
      onTap: () {},
    );
  }
}
