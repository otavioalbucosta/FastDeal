import 'package:fast_deal/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:convert';

String userTable = "userTable";

String idColumn = "idColumn";
String nomeColumn = "nomeColumn";
String emailColumn = "emailColumn";
String telefoneColumn = "telefoneColumn";
String imagemColumn = "imagemColumn";
String hashSenhaColumn = "hashSenhaColumn";

String productTable = "productTable";
String usuarioIdColumn = "usuarioIdColumn";
String tituloColumn = "tituloColumn";
String precoColumn = "precoColumn";
String descricaoColumn = "descricaoColumn";
String categoriaColumn = "categoriaColumn";
String cepColumn = "cepColumn";
String statusColumn = "statusColumn";

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "databasehelper.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $userTable($idColumn INTEGER PRIMARY KEY, $nomeColumn TEXT, $emailColumn TEXT, $telefoneColumn TEXT,$hashSenhaColumn TEXT)");
      await db.execute(
          "CREATE TABLE $productTable($idColumn INTEGER PRIMARY KEY, $usuarioIdColumn INTEGER, $tituloColumn TEXT, $precoColumn REAL, $imagemColumn TEXT, $descricaoColumn TEXT, $categoriaColumn TEXT, $cepColumn TEXT, $statusColumn TEXT, FOREIGN KEY($usuarioIdColumn) REFERENCES $userTable($idColumn))");
    }, onConfigure: (Database db) async {
      await db.execute("PRAGMA foreign_keys = ON");
    });
  }

  Future<List<Usuario>> getUsuario(String login) async {
    Database? dbUser = await db;
    List<Map> list = await dbUser!
        .rawQuery("SELECT * FROM $userTable WHERE $nomeColumn = ?", [login]);
    List<Usuario> userList = [];
    for (Map m in list) {
      userList.add(Usuario.fromMap(m));
    }
    return userList;
  }
}
