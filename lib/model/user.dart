import 'package:fast_deal/model/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Usuario {
  int? id;
  String? nome;
  String? email;
  String? cpf;
  String? telefone;
  String? imagemPerfil;
  List<Product>? produtos;
  String? hashSenha;

  Product criaProduto({
    String? titulo,
    String? descricao,
    String? cep,
    String? categoria,
    double? preco,
  }) {
    produtos!.add(Product(this, titulo, preco, descricao, categoria, cep));
    return produtos!.last;
  }
}
