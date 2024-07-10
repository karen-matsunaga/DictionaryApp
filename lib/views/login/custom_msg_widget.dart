import 'package:provider/provider.dart' as provider;
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:flutter/material.dart';

class CustomLetter extends StatefulWidget {
  final String text;
  final VoidCallback callBack;

  const CustomLetter({super.key, required this.text, required this.callBack});

  @override
  State<CustomLetter> createState() => _CustomLetterState();
}

class _CustomLetterState extends State<CustomLetter> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callBack,
      child: Text(
        widget.text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          fontSize:
              provider.Provider.of<FontSizeConfig>(context).fontSize / 1.50,
        ),
      ),
    );
  }
}
