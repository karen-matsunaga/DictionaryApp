// ignore_for_file: file_names, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

// import 'package:dictionary/menu/homepage-perfil.dart';
// import 'package:dictionary/menu/homepage.dart';
// import 'package:dictionary/provider/fontsize-provider.dart';
// import 'package:dictionary/style.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AccountUpdatePage extends StatelessWidget {
//   const AccountUpdatePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).brightness == Brightness.dark
//             ? Theme.of(context).scaffoldBackgroundColor
//             : mainThemeApp,
//         elevation: 0,
//       ),
//       drawer: Drawer(
//         child: HomePage(),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Nome do aplicativo
//                 Text(
//                   "Perfil",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: Provider.of<FontSizeConfig>(context).fontSize),
//                 ),

//                 // Logo do aplicativo
//                 Container(
//                   width: 100,
//                   height: 100,
//                   margin: EdgeInsets.all(20),
//                   child: Center(
//                     child: Image.asset(
//                       'images/Logo.png',
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                       color: Theme.of(context).brightness == Brightness.dark
//                           ? Colors.grey
//                           : appLogo,
//                       borderRadius: BorderRadius.circular(10)),
//                 ),

//                 // NOME E SOBRENOME DO PERFIL
//                 Container(
//                   width: 400,
//                   padding: EdgeInsets.only(bottom: 20, top: 20),
//                   child: TextField(
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                       hintText: 'Fulano Ciclano',
//                       hintStyle: TextStyle(
//                           fontSize:
//                               Provider.of<FontSizeConfig>(context).fontSize),
//                       filled: true,
//                       fillColor: Theme.of(context).brightness == Brightness.dark
//                           ? campoescuro
//                           : campoPerfil,
//                     ),
//                   ),
//                 ),

//                 // E-MAIL DO PERFIL
//                 Container(
//                   width: 400,
//                   padding: EdgeInsets.only(bottom: 20, top: 20),
//                   child: TextField(
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: BorderSide.none,
//                       ),
//                       hintText: 'fulanociclano@email.com',
//                       hintStyle: TextStyle(
//                           fontSize:
//                               Provider.of<FontSizeConfig>(context).fontSize),
//                       filled: true,
//                       fillColor: Theme.of(context).brightness == Brightness.dark
//                           ? campoescuro
//                           : campoPerfil,
//                     ),
//                   ),
//                 ),

//                 // Botão SALVAR ALTERAÇÕES
//                 Column(
//                   children: [
//                     Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
//                     TextButton(
//                       style: TextButton.styleFrom(
//                         backgroundColor:
//                             Theme.of(context).brightness == Brightness.dark
//                                 ? buttonDarkOne
//                                 : buttonLightOne,
//                         foregroundColor: Colors.black,
//                         padding: EdgeInsets.symmetric(horizontal: 40),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const FirstPage()),
//                         );
//                       },
//                       child: Text('Salvar alterações',
//                           style: TextStyle(
//                               fontSize: Provider.of<FontSizeConfig>(context)
//                                   .fontSize)),
//                     ),
//                   ],
//                 ),

//                 // // Botão VOLTAR
//                 Column(
//                   children: [
//                     Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
//                     TextButton(
//                       style: TextButton.styleFrom(
//                         backgroundColor:
//                             Theme.of(context).brightness == Brightness.dark
//                                 ? buttonDarkOne
//                                 : buttonLightOne,
//                         foregroundColor: Colors.black,
//                         padding: EdgeInsets.symmetric(horizontal: 40),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const FirstPage()),
//                         );
//                       },
//                       child: Text('Voltar',
//                           style: TextStyle(
//                               fontSize: Provider.of<FontSizeConfig>(context)
//                                   .fontSize)),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
