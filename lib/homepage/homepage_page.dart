import 'package:dictionary/provider/fontsize_provider.dart';
import 'package:dictionary/menu/menu_page.dart';
import 'package:dictionary/homepage/search_page.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/style.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart' as provider;
=======
import 'package:provider/provider.dart';
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({super.key});

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  final _searchController = TextEditingController();

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
        title: Text("Códex do Programador".toUpperCase(),
            style: TextStyle(
                letterSpacing: 1,
<<<<<<< HEAD
                fontSize:
                    provider.Provider.of<FontSizeConfig>(context).fontSize)),
=======
                fontSize: Provider.of<FontSizeConfig>(context).fontSize)),
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58
        centerTitle: true,
        // Fundo do aplicativo da AppBar
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? appLogo
            : Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
      ),

      // Opções do Menu de configurações
      drawer: const HomePage(),

      // BARRA DE PESQUISA para pesquisar as palavras
      body: Center(
        child: PreferredSize(
          preferredSize: const Size(50.0, 50.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                    fontSize: Provider.of<FontSizeConfig>(context).fontSize),
                // Icone de pesquisa e fechar da barra de pesquisa
                prefixIcon: Icon(
                  Icons.search_rounded,
<<<<<<< HEAD
                  size: provider.Provider.of<FontSizeConfig>(context).fontSize,
=======
                  size: Provider.of<FontSizeConfig>(context).fontSize,
>>>>>>> 400a6f1a4c61598388e296e26b18d40d51543b58
                ),
                hintText: 'Search',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero,
                filled: true,
              ),
              onSubmitted: (value) async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DictionarySearchPage(),
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
