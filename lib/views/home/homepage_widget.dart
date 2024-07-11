import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/models/users.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/views/home/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:provider/provider.dart' as provider;

class HomePage extends StatefulWidget {
  final Users? profile;
  const HomePage({super.key, this.profile});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // CONTROLADORES
  final _searchController = TextEditingController();

  // INICIALIZAR O BANCO DE DADOS

  Users? profile;
  @override
  void initState() {
    super.initState();
    profile = widget.profile;
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar do aplicativo
      appBar: AppBar(
        // Icone do Menu de configurações
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark
              ? backgroundIconsWhite
              : backgroundAppBarIcons,
        ),
        // Nome do aplicativo
        title: Text(profile?.email ?? "".toUpperCase(),
            style: TextStyle(
                letterSpacing: 1,
                fontSize:
                    provider.Provider.of<FontSizeConfig>(context).fontSize)),
        centerTitle: true,

        // Fundo do aplicativo da AppBar
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? appLogo
            : Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
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
              controller: _searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontSize:
                        provider.Provider.of<FontSizeConfig>(context).fontSize),
                // Icone de pesquisa e fechar da barra de pesquisa
                prefixIcon: Icon(
                  Icons.search_rounded,
                  size: provider.Provider.of<FontSizeConfig>(context).fontSize,
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
