import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

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
      leading: Icon(
        icon,
        size: provider.Provider.of<FontSizeConfig>(context).fontSize,
        color: Theme.of(context).listTileTheme.iconColor,
      ),
      title: Text(
        title,
        style: TextStyle(
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
            fontSize: provider.Provider.of<FontSizeConfig>(context).fontSize),
      ),
      onTap: callback,
    );
  }
}
