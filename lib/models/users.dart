import 'dart:convert';

// CONVERSÃO DO ARQUIVO JSON PARA DART
Users usersFromMap(String str) => Users.fromMap(json.decode(str));
String usersToMap(Users data) => json.encode(data.toMap());

// A CLASSE USERS ARMAZENARÁ OS USUÁRIOS CADASTRADOS NO ARQUIVO JSON
// PARA SEREM GUARDADAS NO BANCO DE DADOS SQFLITE

class Users {
  final int? userId;
  final String? userName;
  final String email, userPassword;

  Users({
    this.userId,
    this.userName,
    required this.email,
    required this.userPassword,
  });

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "userName": userName,
        "email": email,
        "userPassword": userPassword,
      };

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        userId: json["userId"],
        userName: json["userName"],
        email: json["email"],
        userPassword: json["userPassword"],
      );
}
