// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:dictionary/login/login_page.dart';
import 'package:dictionary/login/password_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/style.dart';
import 'package:provider/provider.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).scaffoldBackgroundColor
          : backgroundApp,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Nome do aplicativo
              Text(
                "Códex do Programador",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Provider.of<FontSizeConfig>(context).fontSize),
              ),

              // Logo do aplicativo
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Image.asset(
                    'images/Logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey
                        : appLogo,
                    borderRadius: BorderRadius.circular(10)),
              ),

              // CAMPO E-MAIL
              // Row(
              //   children: [
              //     Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
              //     Text(
              //       'E-mail',
              //       style: TextStyle(
              //           fontSize:
              //               Provider.of<FontSizeConfig>(context).fontSize),
              //       textAlign: TextAlign.left,
              //     ),
              //   ],
              // ),

              // ENTRADA DE DADOS CAMPO E-MAIL
              TextField(
                style: TextStyle(
                    fontSize: Provider.of<FontSizeConfig>(context).fontSize),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'E-mail', hintText: 'fulanociclano@email.com'),
                // decoration: InputDecoration(
                //   border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10),
                //     borderSide: BorderSide.none,
                //   ),
                //   hintText: 'fulanociclano@email.com',
                //   filled: true,
                //   fillColor: Theme.of(context).brightness == Brightness.dark
                //       ? campoescuro
                //       : campoclaro,
                // ),
              ),

              // MENSAGEM DA REDEFINIÇÃO DA SENHA
              Center(
                child: Container(
                  width: 400,
                  height: 400,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? campoescuro
                        : backgroundAccount,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Clique no botão Enviar solicitação para enviar a redefinição de senha no e-mail preenchido. Entre no e-mail e clique na opção Redefinir a senha para entrar na página de redefinição da senha.',
                    style: TextStyle(
                        fontSize:
                            Provider.of<FontSizeConfig>(context).fontSize),
                    maxLines: 7,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),

              // Botão ENVIAR SOLICITAÇÃO
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? buttonDark
                                : buttonLight,
                        padding: EdgeInsets.symmetric(horizontal: 40)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PasswordConfirmation()),
                      );
                    },
                    child: Text('Enviar solicitação',
                        style: TextStyle(
                            fontSize:
                                Provider.of<FontSizeConfig>(context).fontSize)),
                  ),
                ],
              ),
              // Botão VOLTAR
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
                  TextButton(
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? buttonDarkOne
                                : buttonLightOne,
                        padding: EdgeInsets.symmetric(horizontal: 40)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: Text('Voltar',
                        style: TextStyle(
                            fontSize:
                                Provider.of<FontSizeConfig>(context).fontSize)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
