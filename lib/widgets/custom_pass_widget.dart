import 'package:dictionary/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordForm extends StatefulWidget {
  // ATRIBUTOS DA CLASSE PASSWORDFIELD
  final TextEditingController controller;
  final String label, hint;
  final Function(String?) validator;

  const PasswordForm(
      {super.key,
      required this.hint,
      required this.controller,
      required this.label,
      required this.validator});

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;
    print('Altura: $height');
    print('Largura: $width');
    print('Orientation: $orientation');
    // DESIGN DO FORMULÁRIO DE SENHA
    if (width > 600) {
      return Container(
        height: height * .25,
        width: width * .9,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondary,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0.0, 4.0),
              blurRadius: 4.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        // INSERÇÃO DOS DADOS NO SQFLITE
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          maxLines: 1,
          style: TextStyle(
            fontSize: Provider.of<FontSizeConfig>(context).fontSize,
          ),
          controller: widget.controller,
          obscureText: _obscureText,
          validator: (value) => widget.validator(value),
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            errorStyle: TextStyle(
              color: Theme.of(context).colorScheme.onError,
            ),
            icon: const Icon(
              Icons.lock_outline_rounded,
            ),
            border: InputBorder.none,
            labelText: widget.label,
            hintText: widget.hint,
            // VISUALIZAÇÃO DA SENHA
            suffixIcon: IconButton(
              color: Theme.of(context).iconTheme.color,
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: height * .15,
        width: width * .9,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondary,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0.0, 4.0),
              blurRadius: 4.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        // INSERÇÃO DOS DADOS NO SQFLITE
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          maxLines: 1,
          style: TextStyle(
            fontSize: Provider.of<FontSizeConfig>(context).fontSize,
          ),
          controller: widget.controller,
          obscureText: _obscureText,
          validator: (value) => widget.validator(value),
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            errorStyle: TextStyle(
              color: Theme.of(context).colorScheme.onError,
            ),
            icon: const Icon(
              Icons.lock_outline_rounded,
            ),
            border: InputBorder.none,
            labelText: widget.label,
            hintText: widget.hint,
            // VISUALIZAÇÃO DA SENHA
            suffixIcon: IconButton(
              color: Theme.of(context).iconTheme.color,
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
        ),
      );
    }
  }
}
