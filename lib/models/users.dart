import 'dart:convert';

// CONVERSÃO DO ARQUIVO JSON PARA DART
Users usersFromMap(String str) => Users.fromMap(json.decode(str));
String usersToMap(Users data) => json.encode(data.toMap());

// LISTA DOS USUÁRIOS CADASTRADOS
List<Users> usersList = [];

// CLASSE USERS QUE SERÃO ARMAZENADOS OS DADOS
// DOS USUÁRIOS CADASTRADOS EM ARQUIVO JSON
// PARA SEREM GUARDADAS NO BANCO DE DADOS

class Users {
  final int? userId;
  final String? userName;
  final String email;
  final String userPassword;

  Users({
    this.userId,
    this.userName,
    required this.email,
    required this.userPassword,
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        userId: json["userId"],
        userName: json["userName"],
        email: json["email"],
        userPassword: json["userPassword"],
      );

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "userName": userName,
        "email": email,
        "userPassword": userPassword,
      };

  static map(Users Function(dynamic e) param0) {}
}
