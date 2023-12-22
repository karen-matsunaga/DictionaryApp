// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_key_in_widget_constructors, prefer_final_fields, camel_case_types, use_build_context_synchronously, unused_element
import 'package:dictionary/provider/darktheme-provider.dart';
import 'package:dictionary/provider/fontsize-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfigurationPage extends StatefulWidget {
  ConfigurationPage({super.key});

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
                  children: [
                    Column(
                      children: [
                        Row(
                          children: <Widget>[
                            // TÍTULO DA CONFIGURAÇÃO
                            Text(
                              'Tamanho da Fonte',
                              style:
                                  TextStyle(fontSize: fontSizeConfig.fontSize),
                            ),
                          ],
                        ),
                        ToggleButtons(
                          // OPÇÃO NÃO SELECIONADA
                          borderColor:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                          // OPÇÃO SELECIONADA
                          selectedColor: Color.fromRGBO(66, 133, 244, 1),
                          selectedBorderColor:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Color.fromRGBO(250, 196, 45, 0.98)
                                  : Colors.grey,
                          fillColor: Colors.white70,
                          children: <Widget>[
                            // OPÇÕES DE TAMANHO DA FONTE
                            Text('A', style: TextStyle(fontSize: 16)),
                            Text('A', style: TextStyle(fontSize: 20)),
                            Text('A', style: TextStyle(fontSize: 24)),
                          ],
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
                        ),
                      ],
                    ),
                  ],
                ),
                // TEMA CLARO/ESCURO DO APLICATIVO
                Row(children: [
                  Text(
                    'Esquemas de cores',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize:
                            Provider.of<FontSizeConfig>(context).fontSize),
                  ),
                  IconButton(
                    icon: Icon(
                      Theme.of(context).brightness == Brightness.dark
                          ? Icons.nightlight_round
                          : Icons.wb_sunny,
                    ),
                    onPressed: () {
                      // Aqui alteramos o status do Dark Mode e o Provider se encarrega de avisar ao MaterialApp
                      setState(
                        () {
                          themeProvider.isDarkMode
                              ? themeProvider.isDarkMode = false
                              : themeProvider.isDarkMode = true;
                        },
                      );
                    },
                  ),
                ])
              ],
            ),
          ),
        );
      },
    );
  }
}
