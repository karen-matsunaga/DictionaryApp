import 'package:dictionary/controllers/fontsize_provider.dart';
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
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Color.fromARGB(245, 20, 99, 218)),
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
