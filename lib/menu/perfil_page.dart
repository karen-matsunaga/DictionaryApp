// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, file_names

// import 'package:dictionary/perfil/dictionary-updateaccount.dart';
import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:dictionary/menu/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/style.dart';
import 'package:provider/provider.dart';
// import 'package:dictionary/login/dictionary-registeraccount.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).scaffoldBackgroundColor
            : mainThemeApp,
        elevation: 0,
      ),
      drawer: Drawer(
        child: HomePage(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Nome do aplicativo
              Text(
                "Perfil",
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

              // NOME E SOBRENOME DO PERFIL
              Center(
                child: Container(
                  height: 65,
                  width: 400,
                  margin: EdgeInsets.only(bottom: 50, top: 50),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? campoescuro
                          : campoPerfil,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0.0, 4.0),
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                        )
                      ]),
                  child: Text(
                    'Fulano Ciclano',
                    style: TextStyle(
                        fontSize:
                            Provider.of<FontSizeConfig>(context).fontSize),
                    maxLines: 1,
                  ),
                ),
              ),

              // E-MAIL DO PERFIL
              Center(
                child: Container(
                  height: 65,
                  width: 400,
                  margin: EdgeInsets.only(bottom: 50, top: 50),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? campoescuro
                          : campoPerfil,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0.0, 4.0),
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                        )
                      ]),
                  child: Text('fulanociclano@email.com',
                      style: TextStyle(
                          fontSize:
                              Provider.of<FontSizeConfig>(context).fontSize)),
                ),
              ),

              // Botão ALTERAR CONTA
              // Column(
              //   children: [
              //     Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
              //     TextButton(
              //       style: TextButton.styleFrom(
              //         backgroundColor:
              //             Theme.of(context).brightness == Brightness.dark
              //                 ? buttonDarkOne
              //                 : buttonLightOne,
              //         foregroundColor: Colors.black,
              //         padding: EdgeInsets.symmetric(horizontal: 40),
              //       ),
              //       onPressed: () {
              //         // Navigator.push(
              //         //   context,
              //         //   MaterialPageRoute(
              //         //       builder: (context) => const AccountUpdatePage()),
              //         // );
              //       },
              //       child: Text('Alterar conta',
              //           style: TextStyle(
              //               fontSize:
              //                   Provider.of<FontSizeConfig>(context).fontSize)),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
