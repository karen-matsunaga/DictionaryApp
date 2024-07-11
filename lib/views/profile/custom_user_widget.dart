import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDrawer extends StatefulWidget {
  // final String name, email;

  final String name;
  const UserDrawer({
    super.key,
    // required this.name,
    required this.name,
  });

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(color: Color.fromARGB(245, 20, 99, 218)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // NOME DO USUÁRIO
          // Text(
          //   widget.name,
          //   maxLines: 1,
          //   style: TextStyle(
          //     color: Colors.black,
          //     letterSpacing: 2,
          //     fontWeight: FontWeight.bold,
          //     fontSize: Provider.of<FontSizeConfig>(context).fontSize / 1.50,
          //   ),
          // ),

          // EMAIL DO USUÁRIO
          Text(
            widget.name,
            maxLines: 1,
            style: TextStyle(
              color: Colors.black,
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
