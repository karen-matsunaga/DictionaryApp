import 'package:dictionary/controllers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/views/home/custom_icon_widget.dart';
import 'package:dictionary/views/login/login_widget.dart';
import 'package:dictionary/views/home/homepage_widget.dart';
import 'package:dictionary/views/profile/custom_user_widget.dart';
import 'package:dictionary/views/profile/config_update_view.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Drawer(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.blue[900]
              : Theme.of(context).appBarTheme.backgroundColor,
          child: Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              // OS DADOS ESTIVEREM VAZIOS
              if (userProvider.userName == null || userProvider.email == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              // SE OS DADOS EXISTIREM
              else {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                        minWidth: constraints.maxWidth),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          // REFATORADA - PERFIL
                          UserDrawer(
                            name: userProvider.userName ?? "No name",
                            email: userProvider.email ?? "No email",
                          ),
                          // REFATORADA - PÁGINA INICIAL
                          IconDrawer(
                            icon: Icons.home,
                            title: 'Início'.toUpperCase(),
                            callback: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            },
                          ),

                          // REFATORADA - CONFIGURAÇÕES
                          IconDrawer(
                            icon: Icons.settings,
                            title: 'Configurações'.toUpperCase(),
                            callback: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MenuConfigurationPage(),
                                ),
                              );
                            },
                          ),

                          // REFATORADA - DESLOGAR DA CONTA
                          IconDrawer(
                            icon: Icons.exit_to_app,
                            title: 'Sair'.toUpperCase(),
                            callback: () async {
                              await userProvider.clearUserData();
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
