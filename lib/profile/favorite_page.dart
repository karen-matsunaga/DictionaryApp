// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations, prefer_const_constructors, file_names

import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Lista temporária para a implementação do Banco de Dados
final List<String> palavras = ['Print', 'If', 'Else'];

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(20),
      itemCount: palavras.length,
      itemBuilder: (context, int index) {
        // Retornar todos os comandos favoritos salvos no botão de pesquisa
        return ListTile(
          leading: Text(
            '${palavras[index]}',
            style: TextStyle(
              fontSize: Provider.of<FontSizeConfig>(context).fontSize,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete_forever_sharp,
            ),
          ),
        );
      },
    );
  }
}
