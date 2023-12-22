// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_build_context_synchronously

import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:dictionary/login/login_page.dart';
import 'package:dictionary/search/homepage_page.dart';
// import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/menu/perfil_page.dart';
import 'package:dictionary/menu/favorite_page.dart';
import 'package:dictionary/menu/config_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // color: menu,
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  'Códex do Programador',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Provider.of<FontSizeConfig>(context).fontSize),
                ),
              ),
            ),

            // Menu do perfil
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Provider.of<FontSizeConfig>(context).fontSize)),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FirstPage(),
                  ),
                );
              },
            ),

            // Menu de favoritos
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Favoritos',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Provider.of<FontSizeConfig>(context).fontSize)),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
            ),

            // Menu de configurações
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Provider.of<FontSizeConfig>(context).fontSize)),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ThirdPage(),
                  ),
                );
              },
            ),

            // Página inicial
            ListTile(
              leading: Icon(Icons.search_rounded),
              title: Text('Página inicial',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Provider.of<FontSizeConfig>(context).fontSize)),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomeSearchPage(),
                  ),
                );
              },
            ),

            // Deslogar da conta
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Provider.of<FontSizeConfig>(context).fontSize)),
              onTap: () async {
                // await client.auth.signOut();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
