import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/views/home/search_screen.dart';
import 'package:dictionary/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // CONTROLADORES
  final _searchController = TextEditingController();

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar do aplicativo
      appBar: const CustomAppBar(
        title: "Códex do Programador",
      ),

      // Opções do Menu de configurações
      drawer: const MenuPage(),

      // BARRA DE PESQUISA para pesquisar as palavras
      body: Center(
        child: PreferredSize(
          preferredSize: const Size(50.0, 50.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            // BARRA DE PESQUISA DESIGN
            child: TextField(
              cursorColor: Theme.of(context).colorScheme.onPrimary,
              controller: _searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                hintStyle: TextStyle(
                    fontSize:
                        provider.Provider.of<FontSizeConfig>(context).fontSize),
                // Icone de pesquisa e fechar da barra de pesquisa
                prefixIcon: Icon(
                  Icons.search_rounded,
                  size: provider.Provider.of<FontSizeConfig>(context).fontSize,
                  color: Theme.of(context).iconTheme.color,
                ),
                hintText: 'Search',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero,
                filled: true,
              ),

              // === PESQUISA DA PALAVRA - CONTROLADOR E BANCO DE DADOS ===
              onSubmitted: (value) async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
