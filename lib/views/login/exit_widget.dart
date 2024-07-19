import 'package:dictionary/views/login/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExitDialogApp extends StatefulWidget {
  final Widget? child;
  const ExitDialogApp({super.key, this.child});

  @override
  State<ExitDialogApp> createState() => _ExitDialogAppState();
}

class _ExitDialogAppState extends State<ExitDialogApp> {
  @override
  Widget build(BuildContext context) {
    // FUNÇÃO PARA EXIBIR A CAIXA DE DIÁLOGO DE SAÍDA
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Confirmação de Saída'),
              content:
                  const Text('Você tem certeza que deseja sair do aplicativo?'),
              actions: [
                // CANCELAR A SAÍDA
                CustomButton(
                  text: 'Cancelar',
                  callBack: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                // SAIR DO APLICATIVO
                CustomButton(
                  color: Colors.red,
                  text: 'Sair',
                  callBack: () {
                    Navigator.of(context).pop(true);
                    // Atrasar para garantir que a caixa de diálogo seja fechada antes de sair do app
                    Future.delayed(
                      const Duration(milliseconds: 200),
                      () {
                        // Sair do aplicativo
                        SystemNavigator.pop();
                      },
                    );
                  },
                ),
              ],
            );
          },
        );
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: const Text('Sair'),
    );
  }
}
