// import 'package:dictionary/controllers/fontsize_provider.dart';
// import 'package:provider/provider.dart' as provider;
// import 'package:flutter/material.dart';

// class CustomAppbarWidget extends StatelessWidget {
//   final String title;
//   const CustomAppbarWidget({super.key, required this.title});

//   @override
//   Widget build(BuildContext context) {
//     appBar = AppBar(
//       // Icone do Menu de configurações
//       iconTheme: IconThemeData(
//         color: Theme.of(context).iconTheme.color,
//       ),
//       // TITULO da AppBar
//       title: Text(
//         title.toUpperCase(),
//         style: TextStyle(
//           letterSpacing: 1,
//           fontSize: provider.Provider.of<FontSizeConfig>(context).fontSize,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       centerTitle: true,

//       // FUNDO da AppBar
//       backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//       elevation: 0,
//     );
//     // REMOVER A QUANTIDADE DA TELA DA APPBAR
//     var size = MediaQuery.of(context).size;

//     var screenHeight = (size.height - appBar.prefe);
//     return appBar;
//   }
// }
