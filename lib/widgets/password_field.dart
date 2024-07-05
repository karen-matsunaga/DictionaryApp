import 'package:dictionary/provider/fontsize_provider.dart';
import 'package:dictionary/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Function(String?) validator;

  const PasswordField(
      {super.key,
      required this.controller,
      required this.label,
      required this.validator});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: appLogo,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0.0, 4.0),
            blurRadius: 4.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.next,
        maxLines: 1,
        style:
            TextStyle(fontSize: Provider.of<FontSizeConfig>(context).fontSize),
        controller: widget.controller,
        obscureText: _obscureText,
        validator: (value) => widget.validator(value),
        decoration: InputDecoration(
          fillColor: null,
          icon: const Icon(
            Icons.lock_outline_rounded,
          ),
          border: InputBorder.none,
          labelText: widget.label,
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
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
