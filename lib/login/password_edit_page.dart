// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, sort_child_properties_last

import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:dictionary/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/style.dart';
import 'package:provider/provider.dart';

class PasswordConfirmation extends StatelessWidget {
  const PasswordConfirmation({super.key});

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

              // CAMPO NOVA SENHA
              // Row(
              //   children: [
              //     Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
              //     Text(
              //       'Nova senha',
              //       style: TextStyle(
              //           fontSize:
              //               Provider.of<FontSizeConfig>(context).fontSize),
              //       textAlign: TextAlign.left,
              //     ),
              //   ],
              // ),

              // ENTRADA DE DADOS NOVA SENHA
              TextField(
                style: TextStyle(
                    fontSize: Provider.of<FontSizeConfig>(context).fontSize),
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Nova senha', hintText: 'Nova senha'),
                // decoration: InputDecoration(
                //   border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(10),
                //     borderSide: BorderSide.none,
                //   ),
                //   hintText: 'Nova senha',
                //   filled: true,
                //   fillColor: Theme.of(context).brightness == Brightness.dark
                //       ? campoescuro
                //       : campoclaro,
                // ),
              ),

              // CAMPO REESCREVA A NOVA SENHA
              // Row(
              //   children: [
              //     Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
              //     Text(
              //       'Reescreva a nova senha',
              //       style: TextStyle(
              //           fontSize:
              //               Provider.of<FontSizeConfig>(context).fontSize),
              //       textAlign: TextAlign.left,
              //     ),
              //   ],
              // ),

              // ENTRADA DE DADOS CAMPO REESCREVA A NOVA SENHA
              TextField(
                style: TextStyle(
                    fontSize: Provider.of<FontSizeConfig>(context).fontSize),
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Reescreva a nova senha',
                  hintText: 'Reescreva a nova senha',
                  // labelStyle: TextStyle(
                  //     fontSize:
                  //         Provider.of<FontSizeConfig>(context).fontSize)
                ),
              ),
              // decoration: InputDecoration(
              //   border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(10),
              //     borderSide: BorderSide.none,
              //   ),
              //   hintText: 'Reescreva a nova senha',
              //   filled: true,
              //   fillColor: Theme.of(context).brightness == Brightness.dark
              //       ? campoescuro
              //       : campoclaro,
              // ),
              // ),

              // Botão REDEFINIR SENHA
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
                              ? buttonDarkOne
                              : buttonLightOne,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: Text('Redefinir senha',
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
