import 'package:fast_deal/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Product {
  int? id;
  Usuario? usuario;
  String? titulo;
  double? preco;
  List<String?>? imagens;
  String? descricao;
  DateTime? dataCriacao;
  String? categoria;
  String? cep;
  String? status;

  Product(this.usuario, this.titulo, this.preco, this.descricao, this.categoria,
      this.cep,
      [this.status = "A venda", this.imagens, DateTime? dataCriacao])
      : this.dataCriacao = dataCriacao ?? DateTime.now();
}
