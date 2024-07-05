<<<<<<< HEAD
import 'package:dictionary/provider/fontsize_provider.dart';
=======
// ignore_for_file: prefer_const_constructors

import 'package:dictionary/provider/fontsize-provider.dart';
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({
    Key? key,
    required this.name,
  }) : super(key: key);

  // USUÁRIO LOGADO
  final String name;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
<<<<<<< HEAD
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Color.fromARGB(245, 20, 99, 218)),
=======
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: Color.fromARGB(245, 20, 99, 218)),
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            maxLines: 1,
            style: TextStyle(
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              fontSize: Provider.of<FontSizeConfig>(context).fontSize / 1.50,
            ),
          ),
        ],
      ),
    );
  }
}
