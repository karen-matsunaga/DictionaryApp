import 'package:dictionary/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDrawer extends StatefulWidget {
  final String email;

  const UserDrawer({
    super.key,
    required this.email,
  });

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).drawerTheme.backgroundColor,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextSelectionTheme(
              data: TextSelectionThemeData(
                  selectionColor: Colors.amber,
                  selectionHandleColor: Colors.red),
              child: SelectableText(
                'Bem-vindo, ${widget.email}!',
                maxLines: 1,
                style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: Provider.of<FontSizeConfig>(context).fontSize / 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
