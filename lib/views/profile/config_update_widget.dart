import 'package:dictionary/controllers/darktheme_provider.dart';
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // BOTOES RESPONSIVOS
    final double width = MediaQuery.of(context).size.width;
    // final double height = MediaQuery.of(context).size.height;

    // TELA DAS CONFIGURAÇÕES
    return Consumer2<DynamicDarkMode, FontSizeConfig>(
      builder: (context, DynamicDarkMode themeProvider,
          FontSizeConfig fontSizeConfig, child) {
        // TELA DE CONFIGURAÇÕES
        return Scaffold(
          body: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text(
                        'Tamanho da Fonte',
                        style: TextStyle(
                          fontSize: fontSizeConfig.fontSize,
                        ),
                      ),

                      // ESPAÇAMENTO ENTRE OS COMPONENTES
                      SizedBox(width: width * 0.05),

                      // SELEÇÃO DO TAMANHO DA FONTE
                      ToggleButtons(
                        mouseCursor: SystemMouseCursors.none,

                        // TAMANHO DA BORDA
                        borderWidth: 2,
                        borderRadius: BorderRadius.circular(8),

                        // OPÇÃO NÃO SELECIONADA
                        borderColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,

                        // OPÇÃO SELECIONADA
                        selectedColor: backgroundAppBar,
                        selectedBorderColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? backgroundAppBar
                                : Colors.grey,
                        fillColor: Colors.white70,
                        isSelected: [
                          fontSizeConfig.fontSize == 16,
                          fontSizeConfig.fontSize == 20,
                          fontSizeConfig.fontSize == 24,
                        ],
                        onPressed: (int index) {
                          setState(() {
                            double newSize = fontSizeConfig.fontSize;
                            if (index == 0) {
                              newSize = 16.0;
                            } else if (index == 1) {
                              newSize = 20.0;
                            } else if (index == 2) {
                              newSize = 24.0;
                            }
                            fontSizeConfig.saveFontSize(newSize);
                          });
                        },

                        // OPÇÕES DE TAMANHO DA FONTE
                        children: const <Widget>[
                          // PEQUENO - TAMANHO 16
                          Text('P',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          // MÉDIO - TAMANHO 20
                          Text('M',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),

                          // GRANDE - TAMANHO 24
                          Text('G',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // ESPAÇAMENTO DAS LINHAS
              // SizedBox(height: height * 0.05),

              // TEMA CLARO/ESCURO DO APLICATIVO

              // 2. ESQUEMAS DE CORES - TEMA
              GestureDetector(
                onTap: () {
                  // Aqui alteramos o status do Dark Mode e o Provider se encarrega de avisar ao MaterialApp
                  setState(
                    () {
                      themeProvider.isDarkMode
                          ? themeProvider.isDarkMode = false
                          : themeProvider.isDarkMode = true;
                    },
                  );
                },

                // Alteração do Icone quando pressionado o botão
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Esquemas de cores',
                        style: TextStyle(
                            fontSize:
                                Provider.of<FontSizeConfig>(context).fontSize),
                      ),
                    ),
                    // ESPAÇAMENTO ENTRE OS COMPONENTES
                    SizedBox(width: width * 0.05),

                    // ALTERAÇÃO DO ICONE CASO PRESSIONADO
                    Icon(
                      themeProvider.isDarkMode
                          ? Icons.nightlight_round
                          : Icons.wb_sunny,
                      size: Provider.of<FontSizeConfig>(context).fontSize,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
