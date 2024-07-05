// CLASSE USERS QUE SERÃO ARMAZENADOS OS DADOS
// DOS USUÁRIOS CADASTRADOS EM ARQUIVO JSON
// PARA SEREM GUARDADAS NO BANCO DE DADOS

class Users {
  final int? userId;
<<<<<<< HEAD
  final String? userName;
=======
  final String userName;
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58
  final String email;
  final String userPassword;

  Users({
    this.userId,
<<<<<<< HEAD
    this.userName,
=======
    required this.userName,
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58
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
