<<<<<<< HEAD
import 'package:dictionary/provider/fontsize_provider.dart';
=======
// ignore_for_file: prefer_const_constructors

import 'package:dictionary/provider/fontsize-provider.dart';
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58
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
