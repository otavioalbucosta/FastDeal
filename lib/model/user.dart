import 'package:fast_deal/model/database_helper.dart';
import 'package:fast_deal/model/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

String idColumn = "idColumn";
String nomeColumn = "nomeColumn";
String emailColumn = "emailColumn";
String telefoneColumn = "telefoneColumn";
String imagemColumn = "imagemColumn";
String hashSenhaColumn = "hashSenhaColumn";
String userTable = "userTable";
String usuarioIdColumn = "usuarioIdColumn";

class Usuario {
  int? id;
  String? nome;
  String? email;
  String? telefone;
  String? imagem;
  String? hashSenha;
  DatabaseHelper helper = DatabaseHelper();

  Future<Product> criaProduto({
    String? titulo,
    String? descricao,
    String? cep,
    String? categoria,
    double? preco,
  }) async {
    return await Product(this.id, titulo, preco, descricao, categoria, cep)
        .saveProduct();
  }

  Usuario();

  Usuario.fromMap(Map map) {
    id = map[idColumn];
    nome = map[nomeColumn];
    email = map[emailColumn];
    telefone = map[telefoneColumn];
    imagem = map[imagemColumn];
    hashSenha = map[hashSenhaColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      nomeColumn: nome,
      emailColumn: email,
      telefoneColumn: telefone,
      imagemColumn: imagem,
      hashSenhaColumn: hashSenha,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  Future<Usuario> saveUsuario() async {
    Database? dbUser = await helper.db;
    this.id = await dbUser!.insert(userTable, this.toMap());
    return this;
  }

  Future<Product?> getUsuario(int id) async {
    Database? dbUser = await helper.db;
    List<Map> list = await dbUser!.query(userTable,
        columns: [
          idColumn,
          nomeColumn,
          emailColumn,
          telefoneColumn,
          imagemColumn,
          hashSenhaColumn,
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
    Database? dbUser = await helper.db;
    return await dbUser!
        .delete(userTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateProduct(Usuario user) async {
    Database? dbUser = await helper.db;
    return await dbUser!.update(userTable, user.toMap(),
        where: "$idColumn = ?", whereArgs: [user.id]);
  }

  Future<List<Product?>> getProductsList() async {
    Database? dbProduct = await helper.db;
    List<Map> list = await dbProduct!.rawQuery(
        "SELECT * FROM productTable WHERE $usuarioIdColumn = ?", [this.id]);
    List<Product> prodList = [];
    for (Map m in list) {
      prodList.add(Product.fromMap(m));
    }
    return prodList;
  }
}
