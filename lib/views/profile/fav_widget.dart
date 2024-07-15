import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/views/profile/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Lista temporária para a implementação do Banco de Dados
final List<String> palavras = [
  'Print',
  'If',
  'Else',
  'String',
  'Int',
  'Bool',
  'Double'
];

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar do aplicativo
      appBar: const CustomAppBar(title: "Favoritos"),

      // Opções do Menu de configurações
      drawer: const MenuPage(),

      // DESIGN dos favoritos
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: palavras.length,
          itemBuilder: (context, int index) {
            // Retornar todos os comandos favoritos salvos no botão de pesquisa
            return ListTile(
              leading: Text(
                palavras[index],
                style: TextStyle(
                  fontSize: Provider.of<FontSizeConfig>(context).fontSize,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_forever_sharp,
                ),
              ),
            );
          },
        ),
      ),

      // IMPLEMENTAÇÃO PARA ATUALIZAÇÃO DA LISTA
    );
  }
}
