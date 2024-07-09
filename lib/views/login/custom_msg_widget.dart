import 'package:provider/provider.dart' as provider;
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:flutter/material.dart';

class LetterButtonComponent extends StatefulWidget {
  final String text;
  final VoidCallback callBack;

  const LetterButtonComponent(
      {super.key, required this.text, required this.callBack});

  @override
  State<LetterButtonComponent> createState() => _LetterButtonComponentState();
}

class _LetterButtonComponentState extends State<LetterButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callBack,
      child: Text(
        widget.text,
        style: TextStyle(
          letterSpacing: 1,
          fontSize:
              provider.Provider.of<FontSizeConfig>(context).fontSize / 1.50,
        ),
      ),
    );
  }
}
