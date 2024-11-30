import 'package:dictionary/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconDrawer extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback callback;

  const IconDrawer({
    super.key,
    required this.icon,
    required this.title,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    // MENU DA CONFIGURAÇÃO
    return ListTile(
      // CONTEÚDO DOS ICONES
      leading: Icon(
        icon,
        size: Provider.of<FontSizeConfig>(context).fontSize,
        color: Theme.of(context).listTileTheme.iconColor,
      ),
      // CONTEÚDO DOS TEXTOS
      title: Text(
        title.toUpperCase(),
        style: TextStyle(
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            fontSize: Provider.of<FontSizeConfig>(context).fontSize),
      ),
      onTap: callback,
    );
  }
}
