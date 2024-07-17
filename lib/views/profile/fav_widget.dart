import 'package:dictionary/controllers/fontsize_provider.dart';
// import 'package:dictionary/models/users.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/views/profile/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FavoritePage extends StatefulWidget {
  // Lista temporária para a implementação do Banco de Dados
  List<String> palavras = [
    'Print',
    'If',
    'Else',
    'String',
    'Int',
    'Bool',
    'Double',
  ];
  FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // AppBar do aplicativo
      appBar: const CustomAppBar(title: "Favoritos"),

      // Opções do Menu de configurações
      drawer: const MenuPage(),

      // DESIGN dos favoritos
      body: SizedBox(
        height: height,
        width: width,
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: widget.palavras.length,
          itemBuilder: (context, int index) {
            // Retornar todos os comandos favoritos salvos no botão de pesquisa
            return ListTile(
              leading: Text(
                widget.palavras[index],
                style: TextStyle(
                  fontSize: Provider.of<FontSizeConfig>(context).fontSize,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  // IMPLEMENTAR A EXCLUSÃO DO ITEM NA LISTA
                  // BANCO DE DADOS PARA A EXCLUSÃO DA PALAVRA FAVORITA
                },
                icon: const Icon(
                  Icons.delete_forever_sharp,
                ),
              ),
            );
          },
        ),
        // IMPLEMENTAR A ATUALIZAÇÃO DA LISTA
        // BANCO DE DADOS DE ACORDO COM O PERFIL LOGADO
      ),
    );
  }
}
