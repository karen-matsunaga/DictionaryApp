// import 'dart:ffi';
// import 'package:dictionary/controllers/fontsize_provider.dart';
// import 'package:provider/provider.dart' as provider;
import 'package:dictionary/models/dbhelper.dart';
import 'package:dictionary/models/users.dart';
import 'package:dictionary/views/home/custom_icon_widget.dart';
import 'package:dictionary/views/login/login_widget.dart';
import 'package:dictionary/views/home/homepage_widget.dart';
import 'package:dictionary/views/profile/custom_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/views/profile/config_update_view.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // INICIALIZAR O BANCO DE DADOS
  DatabaseHelper? db;
  // late Future<List<Users>>? datalist;
  // late Future<Users?>? loggedUser = Future.value(null);
  late Future<Users?>? loggedUser;
  // late int loggedUserId = 1;

  @override
  void initState() {
    super.initState();
    db = DatabaseHelper();
    // loadData();
    loadLoggedUser();
  }

  // CARREGAMENTO DOS DADOS
  // void loadData() {
  //   setState(() {
  //     datalist = db!.getUser();
  //   });
  // }

  void loadLoggedUser() async {
    int userId = 1;
    setState(() {
      loggedUser = db!.getUserById(userId);
    });
    // loggedUser = db!.getUserById(loggedUserId);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.blue[900]
          : Theme.of(context).appBarTheme.backgroundColor,
      child: FutureBuilder(
          future: loggedUser,
          builder: (context, AsyncSnapshot<Users?> snapshot) {
            // OS DADOS ESTIVEREM VAZIOS
            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } // SE OS DADOS NÃO EXISTIREM
            // ignore: prefer_is_empty
            // else if (snapshot.data!.length == 0) {
            //   return Center(
            //     child: Text(
            //       "No Users Found",
            //       style: TextStyle(
            //           fontSize: provider.Provider.of<FontSizeConfig>(context)
            //               .fontSize),
            //     ),
            //   );
            // }
            // SE OS DADOS EXISTIREM
            else {
              final user = snapshot.data!;
              // return ListView.builder(
              //     scrollDirection: Axis.vertical,
              //     // itemCount: snapshot.data!.length,
              //     itemBuilder: (context, index) {
              //       // String userName = snapshot.data![index].userName.toString();
              //       // String email = snapshot.data![index].email;
              return Column(
                children: [
                  // REFATORADA - PERFIL
                  UserDrawer(
                    name: user.userName ?? "No name",
                    email: user.email,
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
                          builder: (context) => const MenuConfigurationPage(),
                        ),
                      );
                    },
                  ),

                  // REFATORADA - DESLOGAR DA CONTA
                  IconDrawer(
                    icon: Icons.exit_to_app,
                    title: 'Sair'.toUpperCase(),
                    callback: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                ],
              );
              // });
            }
          }),
    );
  }
}
