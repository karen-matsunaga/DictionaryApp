import 'package:dictionary/controllers/user_provider.dart';
import 'package:dictionary/views/profile/fav_screen.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/widgets/custom_icon_widget.dart';
import 'package:dictionary/views/login/login_screen.dart';
import 'package:dictionary/views/home/homepage_screen.dart';
import 'package:dictionary/widgets/custom_user_widget.dart';
import 'package:dictionary/views/profile/config_view.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Drawer(
          backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
          child:
              Consumer<UserProvider>(builder: (context, userProvider, child) {
            // OS DADOS ESTIVEREM VAZIOS
            if (userProvider.email == null) {
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
                        // REFATORADA - PERFIL DO USUÁRIO
                        UserDrawer(
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

                        // REFATORADA - FAVORITOS
                        IconDrawer(
                          icon: Icons.star,
                          title: 'Favoritos'.toUpperCase(),
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
        );
      },
    );
  }
}
