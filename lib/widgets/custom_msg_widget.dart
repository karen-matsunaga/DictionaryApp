import 'package:dictionary/utils/constants.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:flutter/material.dart';

class CustomLetter extends StatefulWidget {
  final String text, message;
  final VoidCallback callBack;

  const CustomLetter(
      {super.key,
      required this.text,
      required this.message,
      required this.callBack});

  @override
  State<CustomLetter> createState() => _CustomLetterState();
}

class _CustomLetterState extends State<CustomLetter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // TEXTO E BOTÃO PARA CRIAR CONTA
        Text(
          widget.message,
          style: TextStyle(
              letterSpacing: 2,
              fontSize: provider.Provider.of<FontSizeConfig>(context).fontSize /
                  1.50),
        ),

        // ESPAÇAMENTO DOS LADOS
        spaceRow,

        // BOTÃO PERSONALIZADO PARA CRIAR CONTA
        GestureDetector(
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
        ),
      ],
    );
  }
}
