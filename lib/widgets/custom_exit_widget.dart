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
            backgroundColor: Colors.red,
            alignment: Alignment.center,
            title: const Text(
              'Confirmação de Saída',
              textAlign: TextAlign.center,
            ),
            content: const Text(
              'Você tem certeza que deseja sair do aplicativo?',
              textAlign: TextAlign.center,
            ),
            actions: [
              // CANCELAR A SAÍDA

              Center(
                child: CustomButton(
                  text: 'Cancelar',
                  callBack: () {
                    Navigator.pop(context, false);
                  },
                ),
              ),
              Center(
                child: CustomButton(
                  color: Colors.red,
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

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // FUNÇÃO PARA SAIR DO APLICATIVO
        PopScope(
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
          child: TextButton(
            onPressed: () async {
              final bool shouldPop = await _showBackDialog() ?? false;
              if (context.mounted && shouldPop) {
                Navigator.pop(context);
              }
            },

            // EXIBIÇÃO DO BOTÃO DE SAIR
            child: IconDrawer(
              icon: Icons.exit_to_app,
              title: 'Sair'.toUpperCase(),
              callback: () async {
                _showBackDialog();
              },
            ),
          ),
        ),
      ],
    );
  }
}
