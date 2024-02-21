// CLASSE USERS QUE SERÃO ARMAZENADOS OS DADOS
// DOS USUÁRIOS CADASTRADOS EM ARQUIVO JSON
// PARA SEREM GUARDADAS NO BANCO DE DADOS

class Users {
  final int? userId;
  final String userName;
  final String email;
  final String userPassword;

  Users({
    this.userId,
    required this.userName,
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
}
