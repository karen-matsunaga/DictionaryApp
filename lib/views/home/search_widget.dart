import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/models/codes.dart';
import 'package:dictionary/views/home/custom_box_widget.dart';
import 'package:dictionary/views/home/custom_fav_widget.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/views/profile/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  Codes? codes;
  SearchPage({super.key, this.codes});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // CONTROLADORES
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // SEARCHBAR APPLICATION
    return Scaffold(
      // AppBar do aplicativo
      appBar: const CustomAppBar(title: "Códex do Programador"),

      // Opções do Menu de configurações
      drawer: const MenuPage(),

      // Texto com a definição da palavra pesquisada com o SQLite
      body: SingleChildScrollView(
        child: StreamBuilder<Codes?>(
          stream: null,
          builder: (context, snapshot) {
            // OS DADOS VAZIOS
            if (snapshot.data == null) {
              return const CircularProgressIndicator();
            }
            // OS DADOS EXISTENTES
            else {
              return Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    // Comando pesquisado e sua função
                    ListTile(
                      title: Text(
                        'Print'.toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                provider.Provider.of<FontSizeConfig>(context)
                                    .fontSize),
                      ),
                      subtitle: Text(
                        'Função principal mostrar na tela.',
                        style: TextStyle(
                            fontSize:
                                provider.Provider.of<FontSizeConfig>(context)
                                    .fontSize),
                      ),
                      // Icone para adicionar a palavra em FAVORITO (NÃO IMPLEMENTADA)
                      trailing: const FavoriteIcon(),
                    ),

                    // Refatoração da primeira box PYTHON
                    const CustomBox(
                        language: 'Python', text: 'print("Olá, mundo!")'),

                    // Refatoração da segunda box C#
                    const CustomBox(
                        language: 'C#',
                        text:
                            'Console.Write("Olá, mundo!");\nConsole.WriteLine("Olá, mundo!");'),

                    // Refatoração da terceira box JAVA

                    const CustomBox(
                        language: 'Java',
                        text:
                            'public class Main { \npublic static void main(String[] args) { \nSystem.out.println("Olá, mundo!"); \n} \n}'),

                    // Refatoração da quarta box SAÍDA DE DADOS
                    const CustomBox(
                        language: 'Saída de Dados', text: 'Olá, mundo!'),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
