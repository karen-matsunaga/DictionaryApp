import 'dart:async';
import 'package:dictionary/models/users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// BANCO DE DADOS SQFLITE
class DatabaseHelper {
  // NOME DA TABELA
  final databaseName = "users.db";
  // CRIAÇÃO DA TABELA NO SQFLITE
  String users =
      "create table users (userId INTEGER PRIMARY KEY AUTOINCREMENT, userName TEXT UNIQUE, email TEXT UNIQUE, userPassword TEXT)";

  // ABRIR O BANCO DE DADOS
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
    });
  }

  // BANCO DE DADOS - LOGIN (VERIFICAÇÃO DA CONTA)
  Future<bool> authenticate(Users user) async {
    final Database db = await initDB();

    var result = await db.rawQuery(
      "select * from users where email = '${user.email}' AND userPassword = '${user.userPassword}'",
    );
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // BANCO DE DADOS - SIGN UP (CRIAR A CONTA)
  Future<int> createUser(Users user) async {
    final Database db = await initDB();

    return db.insert('users', user.toMap());
  }

  // BANCO DE DADOS - LEITURA DOS DADOS DO USUÁRIO PELO ID -- NÃO IMPLEMENTADO

  Future<Users?> getUser(String userName) async {
    final Database db = await initDB();
    var res =
        await db.query('users', where: "userName = ?", whereArgs: [userName]);
    return res.isNotEmpty ? Users.fromMap(res.first) : null;
  }
}
