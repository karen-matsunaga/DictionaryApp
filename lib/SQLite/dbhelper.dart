import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dictionary/JsonModels/users.dart';

class DatabaseHelper {
  // NOME DA TABELA
  final databaseName = "users.db";
  // CRIAÇÃO DA TABELA NO SQLITE
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
  Future<bool> login(Users user) async {
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
  Future<int> signup(Users user) async {
    final Database db = await initDB();

    return db.insert('users', user.toMap());
  }

  // BANCO DE DADOS - VISUALIZAR OS DADOS (PERFIL)
  Future<List<Users>> getNotes() async {
    final Database db = await initDB();
    List<Map<String, Object?>> result = await db.query('users');
    return result.map((e) => Users.fromMap(e)).toList();
  }

  // BANCO DE DADOS - FORGET PASSWORD (ATUALIZAR A CONTA)
  // Future<int> updateUser(Users user) async {
  //   final Database db = await initDB();

  //   return await db.update(
  //     'users',
  //     user.toMap(),
  //     where: "userId = ?",
  //     whereArgs: [user.userId],
  //     conflictAlgorithm: ConflictAlgorithm.replace,
  //   );
  // }

  // Future<int> updateUser(password) async {
  //   final Database db = await initDB();
  //   return await db.rawUpdate(
  //       'update users set userPassword = ? where userId = ?', [password]);
  // }
}
