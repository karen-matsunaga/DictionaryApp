import 'package:dictionary/views/home/custom_icon_widget.dart';
import 'package:dictionary/views/home/custom_user_widget.dart';
import 'package:dictionary/views/login/login_widget.dart';
import 'package:dictionary/views/home/homepage_widget.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/views/profile/fav_view.dart';
import 'package:dictionary/views/profile/config_update_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // final db = DatabaseHelper();

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
