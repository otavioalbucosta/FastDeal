import 'package:fast_deal/model/database_helper.dart';
import 'package:fast_deal/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

String productTable = "productTable";
String idColumn = "idColumn";
String usuarioIdColumn = "usuarioIdColumn";
String tituloColumn = "tituloColumn";
String precoColumn = "precoColumn";
String imagemColumn = "imagemColumn";
String descricaoColumn = "descricaoColumn";
String categoriaColumn = "categoriaColumn";
String cepColumn = "cepColumn";
String statusColumn = "statusColumn";

class Product {
  int? id;
  int? usuario;
  String? titulo;
  double? preco;
  String? imagem;
  String? descricao;
  String? categoria;
  String? cep;
  String? status;
  DatabaseHelper helper = DatabaseHelper();

  Product(this.usuario, this.titulo, this.preco, this.descricao, this.categoria,
      this.cep,
      [this.status = "Ativo", this.imagem]);

  Product.fromMap(Map map) {
    id = map[idColumn];
    usuario = map[usuarioIdColumn];
    titulo = map[tituloColumn];
    preco = map[precoColumn];
    imagem = map[imagemColumn];
    descricao = map[descricaoColumn];
    categoria = map[categoriaColumn];
    cep = map[cepColumn];
    status = map[statusColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      usuarioIdColumn: usuario,
      tituloColumn: titulo,
      precoColumn: preco,
      imagemColumn: imagem,
      descricaoColumn: descricao,
      categoriaColumn: categoria,
      cepColumn: cep,
      statusColumn: status
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  Future<Product> saveProduct() async {
    Database? dbProd = await helper.db;
    this.id = await dbProd!.insert(productTable, this.toMap());
    return this;
  }

  Future<Product?> getProduct(int id) async {
    Database? dbProd = await helper.db;
    List<Map> list = await dbProd!.query(productTable,
        columns: [
          idColumn,
          usuarioIdColumn,
          tituloColumn,
          precoColumn,
          imagemColumn,
          descricaoColumn,
          categoriaColumn,
          cepColumn,
          statusColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (list.length > 0) {
      return Product.fromMap(list.first);
    } else {
      return null;
    }
  }

  Future<int> deleteProduct([int? id]) async {
    if (id == null) {
      id = this.id;
    }
    Database? dbContact = await helper.db;
    return await dbContact!
        .delete(productTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateProduct(Product product) async {
    Database? dbProduct = await helper.db;
    return await dbProduct!.update(productTable, product.toMap(),
        where: "$idColumn = ?", whereArgs: [product.id]);
  }

  Future<List<Product>> getAllProducts() async {
    Database? dbProduct = await helper.db;
    List list = await dbProduct!.rawQuery("SELECT * FROM $productTable");
    List<Product> prodList = [];
    for (Map m in list) {
      prodList.add(Product.fromMap(m));
    }
    return prodList;
  }

  Future<Usuario?> getProductOwner() async {
    Database? dbProduct = await helper.db;
    List<Map> list = await dbProduct!.rawQuery(
        "SELECT * FROM userTable WHERE $idColumn = ?", [this.usuario]);
    if (list.length > 0) {
      return Usuario.fromMap(list.first);
    } else {
      return null;
    }
  }

  Future<List<Product>> getProductsByCategoria(String categoria) async {
    Database? dbProduct = await helper.db;
    List list = await dbProduct!.rawQuery(
        "SELECT * FROM $productTable WHERE $categoriaColumn = ?", [categoria]);
    List<Product> prodList = [];
    for (Map m in list) {
      prodList.add(Product.fromMap(m));
    }
    return prodList;
  }
}
