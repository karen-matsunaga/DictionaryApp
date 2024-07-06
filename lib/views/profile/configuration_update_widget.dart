// import 'package:dictionary/controllers/app-theme.dart';
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
    return Consumer2<DynamicDarkMode, FontSizeConfig>(
      builder: (context, DynamicDarkMode themeProvider,
          FontSizeConfig fontSizeConfig, child) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              children: [
                // TAMANHO DA FONTE NO APLICATIVO
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tamanho da Fonte',
                      style: TextStyle(fontSize: fontSizeConfig.fontSize),
                    ),

                    // 1. OPÇÃO TAMANHO DA FONTE
                    ToggleButtons(
                      mouseCursor: SystemMouseCursors.none,
                      // TAMANHO DA BORDA
                      borderWidth: 3,
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
                      // selectedColor: Color.fromRGBO(66, 133, 244, 1),
                      selectedColor: backgroundAppBar,
                      selectedBorderColor:
                          Theme.of(context).brightness == Brightness.dark
                              // ? Color.fromRGBO(250, 196, 45, 0.98)
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
                      children: const <Widget>[
                        // OPÇÕES DE TAMANHO DA FONTE
                        Text('P',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('M',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('G',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // TEMA CLARO/ESCURO DO APLICATIVO
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Esquemas de cores',
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize:
                              Provider.of<FontSizeConfig>(context).fontSize),
                    ),

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
                      child: Icon(
                        themeProvider.isDarkMode
                            // Theme.of(context).brightness == Brightness.dark
                            ? Icons.nightlight_round
                            : Icons.wb_sunny,
                        size: Provider.of<FontSizeConfig>(context).fontSize,
                        // backgroundColor:
                        //     Theme.of(context).brightness == Brightness.dark
                        //         ? Colors.white
                        //         : Color.fromRGBO(217, 217, 217, 1.0),
                        // Colors.255, 13, 71, 161
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
