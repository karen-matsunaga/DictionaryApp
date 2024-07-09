import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Color? color;
  final VoidCallback? callBack;

  const CustomButton({
    Key? key,
    this.callBack,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      height: 55,
      width: MediaQuery.of(context).size.width * .9,
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
      child: TextButton(
        onPressed: widget.callBack!,
        child: Text(
          widget.text.toUpperCase(),
          style: TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            fontSize: Provider.of<FontSizeConfig>(context).fontSize,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
