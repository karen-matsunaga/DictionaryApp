<<<<<<< HEAD
import 'package:dictionary/provider/fontsize_provider.dart';
=======
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dictionary/provider/fontsize-provider.dart';
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58
import 'package:dictionary/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button extends StatefulWidget {
  final String text;
  final VoidCallback? callBack;

  const Button({
    Key? key,
    required this.text,
    required this.callBack,
  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
<<<<<<< HEAD
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
=======
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58
      height: 55,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: appLogo,
<<<<<<< HEAD
        boxShadow: const [
=======
        boxShadow: [
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0.0, 4.0),
            blurRadius: 4.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextButton(
        onPressed: widget.callBack!,
        child: Text(
          widget.text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Provider.of<FontSizeConfig>(context).fontSize,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              letterSpacing: 2),
        ),
      ),
    );
  }
}
