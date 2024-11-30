import 'package:dictionary/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Color? color;
  final VoidCallback? callBack;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;

  const CustomButton({
    Key? key,
    this.callBack,
    required this.text,
    this.color,
    this.padding,
    this.fontSize,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    if (width > 600) {
      return Center(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          height: height * .2,
          width: width * .3,
          // BORDA DOS BOTÕES
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary,
            // SOMBRA DOS BOTÕES
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0.0, 4.0),
                blurRadius: 4.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          // TEXTO DENTRO DA BORDA
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: TextButton(
              onPressed: widget.callBack!,
              child: Text(
                widget.text.toUpperCase(),
                style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: Provider.of<FontSizeConfig>(context).fontSize,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      // BORDA
      return Center(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          height: height * .1,
          width: width * .5,
          // BORDA DOS BOTÕES
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.secondary,
            // SOMBRA DOS BOTÕES
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0.0, 4.0),
                blurRadius: 4.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          // TEXTO DENTRO DA BORDA
          child: FittedBox(
            child: TextButton(
              onPressed: widget.callBack!,
              child: Text(
                widget.text.toUpperCase(),
                style: TextStyle(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontSize: Provider.of<FontSizeConfig>(context).fontSize,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
