import 'dart:async';
import 'package:dictionary/models/users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// BANCO DE DADOS SQFLITE
class DatabaseHelper {
  // INICIAR BANCO DE DADOS
  initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
    });
  }

  // ARQUIVO DO BANCO DE DADOS
  final databaseName = "users.db";
  // CRIAR A TABELA users NO SQFLITE
  String users =
      "create table users (userId INTEGER PRIMARY KEY AUTOINCREMENT, userName TEXT UNIQUE, email TEXT UNIQUE, userPassword TEXT)";

  // BANCO DE DADOS - VERIFICAR CONTA
  Future<bool> authenticate(Users user) async {
    final Database db = await initDatabase();

    var result = await db.rawQuery(
      "select * from users where email = '${user.email}' AND userPassword = '${user.userPassword}'",
    );
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  // BANCO DE DADOS - CRIAR CONTA
  Future<int> createUser(Users user) async {
    final Database db = await initDatabase();

    return db.insert('users', user.toMap());
  }

  // BANCO DE DADOS - LEITURA DOS DADOS DO USUÁRIO PELO ID -- NÃO IMPLEMENTADO TOTALMENTE --
  // Future<List<Users>> getUser() async {
  //   final Database db = await initDatabase();
  //   final List<Map<String, Object?>> queryResult =
  //       await db.rawQuery('SELECT * FROM users');
  //   return queryResult.map((e) => Users.fromMap(e)).toList();
  // }

  Future<Users?> getUserById(int id) async {
    // Implemente o código para buscar o usuário pelo ID no banco de dados
    // Aqui está um exemplo simples:
    final db = await initDatabase();
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'userId = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return Users.fromMap(result.first);
    } else {
      return null;
    }
  }
}
