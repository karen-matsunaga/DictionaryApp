// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, sort_child_properties_last, avoid_unnecessary_containers

import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:dictionary/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/style.dart';
import 'package:provider/provider.dart';

class AccountConfirmation extends StatelessWidget {
  const AccountConfirmation({super.key});

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

              // MENSAGEM SOBRE O CADASTRO DA CONTA
              Center(
                child: Container(
                  width: 400,
                  height: 400,
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? campoescuro
                        : backgroundAccount,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'O cadastro foi realizado com sucesso. Próximo passo é clicar no botão abaixo para logar na sua conta.',
                    style: TextStyle(
                        fontSize:
                            Provider.of<FontSizeConfig>(context).fontSize),
                    maxLines: 7,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),

              // Botão FAZER LOGIN
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? buttonDark
                              : buttonLight,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: Text('Fazer login',
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
