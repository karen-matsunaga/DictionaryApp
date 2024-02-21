// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers,
// use_build_context_synchronously, prefer_const_literals_to_create_immutables,
// sort_child_properties_last

import 'package:dictionary/JsonModels/users.dart';
import 'package:dictionary/widgets/icons_drawer.dart';
import 'package:dictionary/widgets/user_drawer.dart';
import 'package:dictionary/authentication/login_page.dart';
import 'package:dictionary/homepage/homepage_page.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/menu/favorite_page.dart';
import 'package:dictionary/menu/configuration_page.dart';

class HomePage extends StatelessWidget {
  final Users? profile;
  // const HomePage({Key? key}) : super(key: key);
  const HomePage({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.blue[900]
          : Theme.of(context).appBarTheme.backgroundColor,
      child: ListView(
        children: [
          UserDrawer(
            // name: 'Fulano Ciclano',
            name: profile?.userName ?? "",
          ),

          // REFATORADA - PÁGINA INICIAL
          IconDrawer(
            icon: Icons.home,
            title: 'Início',
            callback: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeSearchPage(),
                ),
              );
            },
          ),

          // REFATORADA - FAVORITOS
          IconDrawer(
            icon: Icons.star,
            title: 'Favoritos',
            callback: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FavoritePage(),
                ),
              );
            },
          ),

          // REFATORADA - CONFIGURAÇÕES
          IconDrawer(
            icon: Icons.settings,
            title: 'Configurações',
            callback: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MenuConfigurationPage(),
                ),
              );
            },
          ),

          // REFATORADA - DESLOGAR DA CONTA
          IconDrawer(
            icon: Icons.exit_to_app,
            title: 'Sair',
            callback: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
