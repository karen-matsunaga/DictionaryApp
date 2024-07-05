import 'package:dictionary/JsonModels/users.dart';
import 'package:dictionary/SQLite/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/style.dart';
import 'package:dictionary/authentication/login_page.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/provider/fontsize_provider.dart';

import '../widgets/password_field.dart';

class AccountCreatePage extends StatefulWidget {
  const AccountCreatePage({Key? key}) : super(key: key);

  @override
  State<AccountCreatePage> createState() => _AccountCreatePageState();
}

class _AccountCreatePageState extends State<AccountCreatePage> {
  // VISUALIZAÇÃO DA SENHA
  bool isVisible = false;

  // CONTROLADORES
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  // VALIDAÇÃO DAS SENHAS DIGITADAS
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value != password.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  // CHAVE GLOBAL PARA O PREENCHIMENTO
  final formKey = GlobalKey<FormState>();

  final db = DatabaseHelper();

  signUp() async {
    final db = DatabaseHelper();
    db
        .signup(Users(
          userName: username.text,
          email: email.text,
          userPassword: password.text,
        ))
        .whenComplete(
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).scaffoldBackgroundColor
          : backgroundApp,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // TITULO DO APLICATIVO
                Text(
                  "Códex do Programador".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                ),

                // ENTRADA DE DADOS CAMPO NOME
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appLogo,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0.0, 4.0),
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                        )
                      ]),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    // CONTROLADOR DO NOME
                    controller: username,
                    style: TextStyle(
                        fontSize: provider.Provider.of<FontSizeConfig>(context)
                            .fontSize),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                        labelText: "Nome",
                        hintText: "Fulano"),
                    validator: (value) {
                      // CAMPO NOME VAZIO
                      if (value!.isEmpty) {
                        return 'Obrigatório preencher o campo Nome';
                      }
                      final isValid =
                          RegExp(r'^[A-Za-z0-9_]{3,24}$').hasMatch(value);
                      if (!isValid) {
                        return 'Mínimo 3 e máximo 24 caracteres';
                      }
                      return null;
                    },
                  ),
                ),

                // ENTRADA DE DADOS CAMPO E-MAIL
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appLogo,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0.0, 4.0),
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                        )
                      ]),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    // CONTROLADOR EMAIL
                    controller: email,
                    style: TextStyle(
                        fontSize: provider.Provider.of<FontSizeConfig>(context)
                            .fontSize),
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email_rounded),
                        border: InputBorder.none,
                        labelText: 'E-mail',
                        hintText: 'fulanociclano@email.com'),
                    validator: (value) {
                      // CAMPO E-MAIL VAZIO
                      if (value!.isEmpty) {
                        return 'Obrigatório preencher o campo E-mail';
                      }
                      return null;
                    },
                  ),
                ),

                // ENTRADA DE DADOS CAMPO SENHA
                PasswordField(
                    controller: password,
                    label: 'Senha',
                    validator: _validatePassword),

                // ENTRADA DE DADOS CAMPO REESCREVA A SENHA
                PasswordField(
                    controller: confirmPassword,
                    label: 'Confirme a senha',
                    validator: _validateConfirmPassword),

                const SizedBox(height: 20),

                // Botão CADASTRAR
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  height: 55,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appLogo,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0.0, 4.0),
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                        )
                      ]),
                  child: TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        signUp();
                      }
                    },
                    child: Text(
                      'Cadastrar'.toUpperCase(),
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: provider.Provider.of<FontSizeConfig>(context)
                            .fontSize,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Botão E MENSAGEM VOLTAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já possui uma conta?',
                      style: TextStyle(
                        letterSpacing: 1,
                        fontSize: provider.Provider.of<FontSizeConfig>(context)
                                .fontSize /
                            1.25,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),

                    // BOTÃO PARA VOLTAR
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Logar'.toUpperCase(),
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize:
                                provider.Provider.of<FontSizeConfig>(context)
                                        .fontSize /
                                    1.25,
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? appLogo
                                    : Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
