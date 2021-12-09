import 'package:fast_deal/model/database_helper.dart';
import 'package:fast_deal/model/product.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

String idColumn = "idColumn";
String nomeColumn = "nomeColumn";
String emailColumn = "emailColumn";
String telefoneColumn = "telefoneColumn";
String hashSenhaColumn = "hashSenhaColumn";
String userTable = "userTable";
String usuarioIdColumn = "usuarioIdColumn";

class Usuario {
  int? id;
  String? nome;
  String? email;
  String? telefone;
  String? hashSenha;
  static DatabaseHelper helper = DatabaseHelper();

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
    hashSenha = map[hashSenhaColumn];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      nomeColumn: nome,
      emailColumn: email,
      telefoneColumn: telefone,
      hashSenhaColumn: hashSenha,
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  Future<int?> saveUsuario() async {
    Database? dbUser = await helper.db;
    this.id = await dbUser!.insert(userTable, this.toMap());
    return this.id;
  }

  static Future<Usuario?> getUsuario(String login) async {
    Database? dbUser = await helper.db;
    List<Map> list = await dbUser!
        .rawQuery("SELECT * FROM $userTable WHERE $nomeColumn = ?", [login]);
    if (list.length > 0) {
      return Usuario.fromMap(list.first);
    } else {
      return null;
    }
  }

  Future<int> deleteUsuario([int? id]) async {
    if (id == null) {
      id = this.id;
    }
    Database? dbUser = await helper.db;
    return await dbUser!
        .delete(userTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateUsuario(Usuario user) async {
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
