import 'package:dictionary/provider/fontsize_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconDrawer extends StatelessWidget {
  const IconDrawer({
    Key? key,
    required this.icon,
    required this.title,
    required this.callback,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: Provider.of<FontSizeConfig>(context).fontSize),
      title: Text(
        title,
        style: TextStyle(
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          fontSize: Provider.of<FontSizeConfig>(context).fontSize,
        ),
      ),
      onTap: callback,
    );
  }
}
