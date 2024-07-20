import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomForm extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final Function(String?) validator;
  final TextInputType textInputType;
  final Icon icon;

  const CustomForm({
    super.key,
    required this.icon,
    required this.textInputType,
    required this.controller,
    required this.label,
    required this.hint,
    required this.validator,
  });

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    // DESIGNER DO CAMPO
    return Container(
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
      // CONFIGURAÇÃO DO CAMPO
      child: TextFormField(
        keyboardType: widget.textInputType,
        textInputAction: TextInputAction.next,
        maxLines: 1,
        style:
            TextStyle(fontSize: Provider.of<FontSizeConfig>(context).fontSize),
        controller: widget.controller,
        validator: (value) => widget.validator(value),
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          errorStyle: TextStyle(color: Theme.of(context).colorScheme.onError),
          icon: widget.icon,
          border: InputBorder.none,
          labelText: widget.label,
          hintText: widget.hint,
        ),
      ),
    );
  }
}
