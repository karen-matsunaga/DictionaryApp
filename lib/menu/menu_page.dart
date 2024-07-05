import 'package:dictionary/widgets/icons_drawer.dart';
import 'package:dictionary/widgets/user_drawer.dart';
import 'package:dictionary/authentication/login_page.dart';
import 'package:dictionary/homepage/homepage_page.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/menu/favorite_page.dart';
import 'package:dictionary/menu/configuration_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.blue[900]
          : Theme.of(context).appBarTheme.backgroundColor,
      child: ListView(
        children: [
          const UserDrawer(
            name: 'Fulano Ciclano',
          ),

          // REFATORADA - PÁGINA INICIAL
          IconDrawer(
            icon: Icons.home,
            title: 'Início',
            callback: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomeSearchPage(),
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
                  builder: (context) => const FavoritePage(),
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
                  builder: (context) => const MenuConfigurationPage(),
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
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
