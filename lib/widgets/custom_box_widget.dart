import 'package:dictionary/controllers/controllers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final String title, code;
  final width;
  CustomBox({
    super.key,
    required this.title,
    required this.code,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Refatoração das BOXES
    return Container(
      width: width,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const Padding(padding: EdgeInsets.only(bottom: 40)),
              // EXIBIÇÃO DO NOME DAS LINGUAGENS
              Expanded(
                child: Text(
                  title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Provider.of<FontSizeConfig>(context).fontSize),
                  maxLines: 1,
                ),
              ),
            ],
          ),
          // CÓDIGOS DAS LINGUAGENS PARA A SAÍDA DE DADOS
          Row(
            children: [
              Expanded(
                child: Text(
                  code,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: Provider.of<FontSizeConfig>(context).fontSize),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
