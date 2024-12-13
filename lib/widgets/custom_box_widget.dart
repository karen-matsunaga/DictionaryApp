import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final String title, code;
  final Color? color;
  final width;
  CustomBox({
    super.key,
    required this.title,
    required this.code,
    this.color,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Refatoração das BOXES
    return Container(
      width: width,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: SelectionArea(
        onSelectionChanged: (value) => context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                // EXIBIÇÃO DO NOME DAS LINGUAGENS
                Expanded(
                  child: TextSelectionTheme(
                    data: TextSelectionThemeData(
                        selectionColor: textSelection,
                        selectionHandleColor: handleColorText),
                    child: SelectableText(
                      title.toUpperCase(),
                      textAlign: TextAlign.center,
                      // style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: Provider.of<FontSizeConfig>(context).fontSize),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.0),
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
            // CÓDIGOS DAS LINGUAGENS PARA A SAÍDA DE DADOS
            Row(
              children: [
                Expanded(
                  child: TextSelectionTheme(
                    data: TextSelectionThemeData(
                        selectionColor: textSelection,
                        selectionHandleColor: handleColorText),
                    child: SelectableText(
                      code,
                      textAlign: TextAlign.justify,
                      // style:
                      // TextStyle(
                      //     fontSize: Provider.of<FontSizeConfig>(context).fontSize),
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
