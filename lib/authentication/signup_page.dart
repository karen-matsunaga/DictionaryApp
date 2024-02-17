// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously, curly_braces_in_flow_control_structures

import 'package:dictionary/JsonModels/users.dart';
import 'package:dictionary/SQLite/sqlite.dart';
// import 'package:dictionary/widgets/email_input_button.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/style.dart';
import 'package:dictionary/authentication/login_page.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/provider/fontsize-provider.dart';

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

  // CHAVE GLOBAL PARA O PREENCHIMENTO
  final formKey = GlobalKey<FormState>();

  // BANCO DE DADOS
  final db = DatabaseHelper();

  // MÉTODO PARA FAZER O CADASTRO DO USUÁRIO
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
          padding: EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // ESPAÇAMENTO ENTRE O TEXTO
                const SizedBox(
                  height: 30,
                ),
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
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appLogo,
                      boxShadow: [
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
                    decoration: InputDecoration(
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
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appLogo,
                      boxShadow: [
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
                    decoration: InputDecoration(
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
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appLogo,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0.0, 4.0),
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                        )
                      ]),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    // CONTROLADOR SENHA
                    controller: password,
                    // VISUALIZAÇÃO DA SENHA
                    obscureText: !isVisible,
                    style: TextStyle(
                        fontSize: provider.Provider.of<FontSizeConfig>(context)
                            .fontSize),
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline_rounded),
                      border: InputBorder.none,
                      labelText: 'Senha',
                      hintText: 'Senha',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: (value) {
                      // CAMPO SENHA VAZIO
                      if (value!.isEmpty) {
                        return 'Obrigatório preencher o campo Senha';
                      }
                      // CAMPO SENHA COM MENOS DE 4 CARACTERES
                      else if (value.length < 4) {
                        return 'Mínimo de 4 caracteres no campo Senha';
                      }
                      return null;
                    },
                  ),
                ),

                // ENTRADA DE DADOS CAMPO REESCREVA A SENHA
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appLogo,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0.0, 4.0),
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                        )
                      ]),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    // CONTROLADOR CONFIRMAÇÃO DE SENHA
                    controller: confirmPassword,
                    // VISUALIZAÇÃO DA SENHA
                    obscureText: !isVisible,
                    style: TextStyle(
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize,
                    ),
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline_rounded),
                      border: InputBorder.none,
                      labelText: 'Reescreva a senha',
                      hintText: 'Reescreva a senha',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                    validator: (value) {
                      // CAMPO REESCREVA A SENHA VAZIO
                      if (value == null || value.isEmpty) {
                        return 'Obrigatório preencher o campo Reescreva a senha';
                      }
                      if (value.length < 4) {
                        return 'Mínimo de 4 caracteres no campo Senha';
                      }
                      // CAMPOS SENHA E REESCREVA SENHA
                      else if (password.text != confirmPassword.text) {
                        return 'As senhas não estão coerentes';
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Botão CADASTRAR
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  height: 55,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appLogo,
                      boxShadow: [
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
                            builder: (context) => LoginPage(),
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
