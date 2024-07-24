import 'package:dictionary/widgets/custom_button_widget.dart';
import 'package:dictionary/widgets/custom_icon_widget.dart';
import 'package:flutter/material.dart';

class CustomExit extends StatefulWidget {
  final VoidCallback? callBack;
  const CustomExit({super.key, this.callBack});

  @override
  State<CustomExit> createState() => _CustomExitState();
}

class _CustomExitState extends State<CustomExit> {
  @override
  Widget build(BuildContext context) {
    // FUNÇÃO PARA EXIBIR A CAIXA DE DIÁLOGO DE SAÍDA
    Future<bool?> _showBackDialog() {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
            alignment: Alignment.center,

            // MENSAGENS DA CAIXA DE DIÁLOGO
            title: Text(
              'Confirmação de Saída',
              textAlign: TextAlign.center,
            ),
            content: const Text(
              'Você tem certeza que deseja sair do aplicativo?',
              textAlign: TextAlign.center,
            ),

            // BOTÕES PARA SAIR OU CANCELAR A AÇÃO
            actions: [
              // BOTÃO DE CANCELAR A SAÍDA
              Center(
                child: CustomButton(
                  text: 'Cancelar',
                  callBack: () {
                    Navigator.pop(context, false);
                  },
                ),
              ),

              // BOTÃO DA SAÍDA DA CONTA LOGADA OU APLICATIVO
              Center(
                child: CustomButton(
                  text: 'Sair',
                  callBack: widget.callBack!,
                ),
              ),

              // SAIR DO APLICATIVO
            ],
          );
        },
      );
    }

    // FUNCIONALIDADE DOS BOTÕES SELECIONADOS
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        if (didPop) {
          return;
        }

        final bool shouldPop = await _showBackDialog() ?? false;
        if (context.mounted && shouldPop) {
          Navigator.pop(context);
        }
      },

      // EXIBIÇÃO DO BOTÃO SAIR DA CONTA E DO APLICATIVO
      child: IconDrawer(
        icon: Icons.exit_to_app,
        title: 'Sair',
        callback: () async {
          final bool shouldPop = await _showBackDialog() ?? false;
          if (context.mounted && shouldPop) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
