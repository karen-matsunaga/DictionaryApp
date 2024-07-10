import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final String language, text;
  const CustomBox({super.key, required this.language, required this.text});

  @override
  Widget build(BuildContext context) {
    // HEIGHT AND WIDTH SIZES
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // Refatoração da primeira box PYTHON
    return Container(
      width: width * .9,
      height: height * .9,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(left: 16, top: 19, right: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? appLogo
              : columns,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(bottom: 40)),
              Expanded(
                child: Text(
                  // 'Python'
                  language.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                  maxLines: 20,
                ),
              ),
            ],
          ),
          // CÓDIGO EM PYTHON PARA A SAÍDA DE DADOS
          Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                  maxLines: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
