import 'package:flutter/material.dart';
import 'package:dictionary/controllers/controllers.dart';
import 'package:dictionary/views/views.dart';
import 'package:dictionary/widgets/widgets.dart';
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
                reverse: true,
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
                          title: 'Início',
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
                                builder: (context) =>
                                    const MenuConfigurationPage(),
                              ),
                            );
                          },
                        ),

                        // REFATORADA - DESLOGAR DA CONTA
                        CustomExit(
                          message: 'Deseja sair da conta?',
                          callBack: () async {
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
