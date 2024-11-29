import 'package:dictionary/controllers/controllers.dart';
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
    // TELA DAS CONFIGURAÇÕES
    return Consumer2<DynamicDarkMode, FontSizeConfig>(
      builder: (context, DynamicDarkMode themeProvider,
          FontSizeConfig fontSizeConfig, child) {
        // TELA DE CONFIGURAÇÕES
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              spaceColumn,
              // SELEÇÃO DO TAMANHO DA FONTE
              ListTile(
                leading: Text(
                  'Tamanho da fonte',
                  style: TextStyle(
                    fontSize: fontSizeConfig.fontSize,
                  ),
                ),
                trailing: ToggleButtons(
                  mouseCursor: SystemMouseCursors.none,

                  // TAMANHO DA BORDA
                  borderWidth: 3,
                  borderRadius: BorderRadius.circular(8),

                  // OPÇÃO NÃO SELECIONADA
                  borderColor: Theme.of(context).toggleButtonsTheme.borderColor,
                  color: Theme.of(context).toggleButtonsTheme.color,

                  // OPÇÃO SELECIONADA
                  selectedColor:
                      Theme.of(context).toggleButtonsTheme.selectedColor,
                  selectedBorderColor:
                      Theme.of(context).toggleButtonsTheme.selectedBorderColor,

                  fillColor: Theme.of(context).toggleButtonsTheme.fillColor,
                  // OPÇÕES DOS TAMANHOS DO APLICATIVO
                  isSelected: [
                    fontSizeConfig.fontSize == 16,
                    fontSizeConfig.fontSize == 20,
                    fontSizeConfig.fontSize == 24,
                  ],
                  // TAMANHO DA FONTE QUANDO PRESSIONADO
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
                    smallText,

                    // MÉDIO - TAMANHO 20
                    mediumText,

                    // GRANDE - TAMANHO 24
                    largeText,
                  ],
                ),
              ),

              // TEMA CLARO/ESCURO DO APLICATIVO
              ListTile(
                leading: Text(
                  'Tema',
                  style: TextStyle(fontSize: fontSizeConfig.fontSize),
                ),
                // ITEM DE CONFIGURAÇÃO TEMA
                trailing: GestureDetector(
                  // Aqui alteramos o status do Dark Mode e o Provider se encarrega de avisar ao MaterialApp
                  onTap: () {
                    setState(
                      () {
                        themeProvider.isDarkMode
                            ? themeProvider.isDarkMode = false
                            : themeProvider.isDarkMode = true;
                      },
                    );
                  },
                  // ALTERAÇÃO DO ICONE CASO PRESSIONADO
                  child: Icon(
                    themeProvider.isDarkMode
                        ? Icons.nightlight_round
                        : Icons.wb_sunny,
                    size: fontSizeConfig.fontSize * 1.2,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
