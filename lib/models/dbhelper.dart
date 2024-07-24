import 'dart:async';
import 'package:dictionary/models/users.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// BANCO DE DADOS SQFLITE
class DatabaseHelper {
  // INICIAR BANCO DE DADOS
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDatabase();
    return _db!;
  }

  // INICIAR BANCO DE DADOS
  initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      // EXECUÇÃO DA TABELA USUÁRIOS
      await db.execute(users);
      // FECHAMENTO DO BANCO DE DADOS
      await db.close();
    });
  }

  // NOME DO BANCO DE DADOS
  final databaseName = "users.db";

  // CRIAÇÃO DA TABELA users NO USERS.DB que é responsável pela autenticação do usuário
  String users =
      "create table users (userId INTEGER PRIMARY KEY AUTOINCREMENT, userName TEXT, email TEXT, userPassword TEXT)";

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
    return db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // BANCO DE DADOS - LEITURA DOS DADOS DO USUÁRIO PELO ID
  Future<Users?> getUser(int id) async {
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

  // BANCO DE DADOS - USUÁRIO DUPLICADO PELO E-MAIL DIGITADO
  Future<bool> checkUserDuplicated(String email) async {
    final db = await initDatabase();
    final List<Map<String, dynamic>> res =
        await db.query('users', where: 'email = ?', whereArgs: [email]);
    return res.isNotEmpty;
  }
}
