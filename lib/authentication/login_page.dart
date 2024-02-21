// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables,
// sort_child_properties_last, use_build_context_synchronously, prefer_final_fields

import 'package:dictionary/JsonModels/users.dart';
import 'package:dictionary/SQLite/sqlite.dart';
import 'package:dictionary/homepage/homepage_page.dart';
import 'package:dictionary/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/style.dart';
import 'package:dictionary/authentication/signup_page.dart';
import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // CONTROLADORES
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();

  // VISUALIZAÇÃO DE SENHA
  bool isVisible = false;

  // VERIFICAR SE ESTÁ LOGADO
  bool isLoginTrue = false;

  // BANCO DE DADOS
  final db = DatabaseHelper();

  // FUNÇÃO LOGIN PARA VERIFICAÇÃO DOS DADOS
  login() async {
    var response = await db.login(
      Users(
        userName: username.text,
        email: email.text,
        userPassword: password.text,
      ),
    );
    if (response == true) {
      // SE OS DADOS ESTIVEREM CORRETOS
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeSearchPage(),
        ),
      );
    } else {
      // CASO CONTRÁRIO RETORNARÁ UMA MENSAGEM DE ERRO
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  // CHAVE GLOBAL PARA O FORMULÁRIO DE PREENCHIMENTO
  final formKey = GlobalKey<FormState>();

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
                // TÍTULO DO APLICATIVO
                Text(
                  "Códex do Programador".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: Provider.of<FontSizeConfig>(context).fontSize),
                ),

                // ENTRADA DE DADOS CAMPO E-MAIL
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: appLogo,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0.0, 4.0),
                        blurRadius: 4.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    controller: email,
                    style: TextStyle(
                        fontSize:
                            Provider.of<FontSizeConfig>(context).fontSize),
                    // ICONE
                    decoration: InputDecoration(
                      fillColor: null,
                      icon: Icon(
                        Icons.email_rounded,
                      ),
                      border: InputBorder.none,
                      hintText: "fulanociclano@email.com",
                      labelText: "E-mail",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Obrigatório preencher o campo E-mail";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),

                // ENTRADA DE DADOS CAMPO SENHA
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: appLogo,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0.0, 4.0),
                        blurRadius: 4.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    controller: password,
                    obscureText: !isVisible,
                    style: TextStyle(
                        fontSize:
                            Provider.of<FontSizeConfig>(context).fontSize),
                    // ICONE
                    decoration: InputDecoration(
                      fillColor: null,
                      icon: Icon(
                        Icons.lock_outline_rounded,
                      ),
                      border: InputBorder.none,
                      hintText: "Senha",
                      labelText: "Senha",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              isVisible = !isVisible;
                            },
                          );
                        },
                        icon: Icon(isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    // VALIDAÇÃO DE SENHA
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Obrigatório preencher o campo Senha';
                      } else if (value.length < 4) {
                        return 'Preencher mínimo 4 caracteres no campo Senha';
                      }
                      return null;
                    },
                  ),
                ),

                // MENSAGEM CASO O E-MAIL E/OU SENHA FORAM PREENCHIDAS INCORRETAMENTE
                isLoginTrue
                    ? Container(
                        margin: EdgeInsets.only(
                          top: 16,
                        ),
                        child: Text(
                          "E-mail ou Senha estão incorretos".toUpperCase(),
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : const SizedBox(),

                const SizedBox(height: 20),

                // BOTÃO LOGAR
                Button(
                    text: "Logar".toUpperCase(),
                    callBack: () {
                      if (formKey.currentState!.validate()) {
                        login();
                      }
                    }),

                const SizedBox(height: 10),

                // BOTÃO CRIAR CONTA
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // TEXTO NÃO POSSUI CONTA
                    Text(
                      "Não possui conta?",
                      style: TextStyle(
                        fontSize:
                            Provider.of<FontSizeConfig>(context).fontSize /
                                1.25,
                        letterSpacing: 1,
                      ),
                    ),

                    // ESPAÇAMENTO ENTRE OS TEXTOS
                    const SizedBox(
                      width: 10,
                    ),

                    // TEXTO SIGN UP
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountCreatePage()),
                        );
                      },
                      child: Text(
                        'Criar conta'.toUpperCase(),
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize:
                              Provider.of<FontSizeConfig>(context).fontSize /
                                  1.50,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? appLogo
                              : Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),

                // **FIM DA COLUNA**
              ],
            ),
          ),
        ),
      ),
    );
  }
}
