import 'package:dictionary/controllers/user_provider.dart';
// import 'package:dictionary/models/dbhelper.dart';
import 'package:flutter/material.dart';
// import 'package:dictionary/models/users.dart';
import 'package:dictionary/views/home/custom_icon_widget.dart';
import 'package:dictionary/views/login/login_widget.dart';
import 'package:dictionary/views/home/homepage_widget.dart';
import 'package:dictionary/views/profile/custom_user_widget.dart';
import 'package:dictionary/views/profile/config_update_view.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
// INICIALIZAR O BANCO DE DADOS
  // DatabaseHelper? db;
  // late Future<Users?>? loggedUser = Future.value(null);
  // LISTAR TODOS OS USUÁRIOS EM LISTA
  // late Future<List<Users>>? datalist;

// CARREGAMENTO DOS DADOS
  // void loadLoggedUser() async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // int? userId = prefs.getInt('userId');
  // int userId = 1;
  // if (userId != null) {
  // setState(() {
  // loggedUser = db!.getUserById(userId);
  // });
  // } else {
  //   return null;
  // }
  // }

  // void saveUserId(int userId) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('userId', userId);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   db = DatabaseHelper();
  //   loadLoggedUser();
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.blue[900]
          : Theme.of(context).appBarTheme.backgroundColor,
      child: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          // OS DADOS ESTIVEREM VAZIOS
          if (userProvider.username == null || userProvider.email == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // SE OS DADOS EXISTIREM
          else {
            // return ListView.builder(
            // scrollDirection: Axis.vertical,
            // itemCount: snapshot.data!.length,
            // itemBuilder: (context, index) {
            // String userName = snapshot.data![index].userName.toString();
            // String email = snapshot.data![index].email;
            return Column(
              children: [
                // REFATORADA - PERFIL
                UserDrawer(
                  name: userProvider.username ?? "No name",
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
                        builder: (context) => const MenuConfigurationPage(),
                      ),
                    );
                  },
                ),

                // REFATORADA - DESLOGAR DA CONTA
                IconDrawer(
                  icon: Icons.exit_to_app,
                  title: 'Sair'.toUpperCase(),
                  callback: () async {
                    // final userProvider =
                    //     Provider.of<UserProvider>(context, listen: false);
                    await userProvider.clearUserData();
                    // ignore: use_build_context_synchronously
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
        },
      ),
    );
  }
}

// return Drawer(
//       backgroundColor: Theme.of(context).brightness == Brightness.dark
//           ? Colors.blue[900]
//           : Theme.of(context).appBarTheme.backgroundColor,
//       child: FutureBuilder(
//         future: loggedUser,
//         builder: (context, AsyncSnapshot<Users?> snapshot) {
//           // OS DADOS ESTIVEREM VAZIOS
//           if (!snapshot.hasData || snapshot.data == null) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           // SE OS DADOS EXISTIREM
//           else {
//             final user = snapshot.data!;
//             // return ListView.builder(
//             // scrollDirection: Axis.vertical,
//             // itemCount: snapshot.data!.length,
//             // itemBuilder: (context, index) {
//             // String userName = snapshot.data![index].userName.toString();
//             // String email = snapshot.data![index].email;
//             return Column(
//               children: [
//                 // REFATORADA - PERFIL
//                 UserDrawer(
//                   name: user.userName ?? "No name",
//                   email: user.email ?? "No email",
//                 ),
//                 // REFATORADA - PÁGINA INICIAL
//                 IconDrawer(
//                   icon: Icons.home,
//                   title: 'Início'.toUpperCase(),
//                   callback: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const HomePage(),
//                       ),
//                     );
//                   },
//                 ),

//                 // REFATORADA - CONFIGURAÇÕES
//                 IconDrawer(
//                   icon: Icons.settings,
//                   title: 'Configurações'.toUpperCase(),
//                   callback: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const MenuConfigurationPage(),
//                       ),
//                     );
//                   },
//                 ),

//                 // REFATORADA - DESLOGAR DA CONTA
//                 IconDrawer(
//                   icon: Icons.exit_to_app,
//                   title: 'Sair'.toUpperCase(),
//                   callback: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => const LoginPage(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             );
//             // });
//           }
//         },
//       ),
//     );