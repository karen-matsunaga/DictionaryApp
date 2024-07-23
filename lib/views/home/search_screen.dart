import 'dart:convert';
// import 'package:dictionary/controllers/favorite_provider.dart';
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/models/words.dart';
import 'package:dictionary/widgets/custom_box_widget.dart';
import 'package:dictionary/widgets/custom_fav_widget.dart';
import 'package:dictionary/views/home/menu_view.dart';
import 'package:dictionary/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // CONTROLADORES
  final searchController = TextEditingController();

  // EXIBIÇÃO DO ID ESPECÍFICO
  var wordName = "";
  Words? word;

  // INICIAR TODA VEZ QUE ACESSAR O APLICATIVO
  @override
  void initState() {
    super.initState();
  }

  // CARREGAR OS DADOS DA PALAVRA ESPECÍFICA
  @override
  void didChangeDependencies() {
    var wordString = ModalRoute.of(context)?.settings.arguments as String;
    var wordJson = jsonDecode(wordString);

    setState(() {
      word = Words.fromJson(wordJson);
      wordName = word!.name;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // ICONE DE SALVAR AS PALAVRAS
    // final favoriteProvider = FavoriteProvider.of(context);

    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    // SEARCHBAR APPLICATION
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // AppBar do aplicativo
      appBar: const CustomAppBar(title: "Códex do Programador"),

      // Opções do Menu de configurações
      drawer: const MenuPage(),

      // Texto com a definição da palavra pesquisada com o arquivo words.JSON
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              // Comando pesquisado e sua função
              ListTile(
                title: Text(
                  word!.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                ),
                subtitle: Text(
                  word!.description,
                  style: TextStyle(
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                ),

                // Icone para adicionar a palavra em FAVORITO (NÃO IMPLEMENTADA)
                trailing: const FavoriteIcon(),
              ),

              // Refatoração da primeira box PYTHON
              CustomBox(language: 'Python'.toUpperCase(), text: word!.python),

              // Refatoração da segunda box C#
              CustomBox(language: 'C#'.toUpperCase(), text: word!.cSharp),

              // Refatoração da terceira box JAVA

              CustomBox(language: 'Java'.toUpperCase(), text: word!.java),

              // Refatoração da quarta box SAÍDA DE DADOS
              CustomBox(
                  language: 'Saída de Dados'.toUpperCase(), text: word!.exit),
            ],
          ),
        ),
      ),
    );
  }
}
