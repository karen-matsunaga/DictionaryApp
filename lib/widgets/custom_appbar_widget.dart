import 'package:dictionary/controllers/controllers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CustomAppbarWidget extends StatelessWidget {
  final String title;
  CustomAppbarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Icone do Menu de configurações
      iconTheme: IconThemeData(
        color: Theme.of(context).iconTheme.color,
      ),
      // TITULO da AppBar
      title: Text(
        title.toUpperCase(),
        style: TextStyle(
          letterSpacing: 1,
          fontSize: Provider.of<FontSizeConfig>(context).fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,

      // FUNDO da AppBar
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
    );
  }
}
