import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  // TAMANHO PREFERENCIAL PELO TAMANHO DA ALTURA
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  // APPBAR PERSONALIZADA
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Icone do Menu de configurações
      iconTheme: IconThemeData(
        color: Theme.of(context).brightness == Brightness.dark
            ? backgroundIconsWhite
            : backgroundAppBarIcons,
      ),
      // Nome do aplicativo
      title: Text(title.toUpperCase(),
          style: TextStyle(
              letterSpacing: 1,
              fontSize:
                  provider.Provider.of<FontSizeConfig>(context).fontSize)),
      centerTitle: true,

      // Fundo do aplicativo da AppBar
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? appLogo
          : Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
    );
  }
}