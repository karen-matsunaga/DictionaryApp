import 'package:dictionary/models/dbhelper.dart';
import 'package:dictionary/models/users.dart';
import 'package:dictionary/views/login/custom_button_widget.dart';
import 'package:dictionary/views/login/custom_field_widget.dart';
import 'package:dictionary/views/login/custom_msg_widget.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:dictionary/views/login/login_widget.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/views/login/custom_pass_widget.dart';

class AccountCreatePage extends StatefulWidget {
  const AccountCreatePage({Key? key}) : super(key: key);

  @override
  State<AccountCreatePage> createState() => _AccountCreatePageState();
}

class _AccountCreatePageState extends State<AccountCreatePage> {
  // CONTROLADORES
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // VALIDAÇÃO DO NOME
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo Nome deve ser preenchido.';
    }
    final isValid = RegExp(r'^[A-Za-z0-9_]{3,24}$').hasMatch(value);
    if (!isValid) {
      return 'O campo Nome deve conter no mínimo 3 e máximo 24 caracteres.';
    }
    return null;
  }

  // VALIDAÇÃO DO E-MAIL
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo E-mail deve ser preenchido.';
    }

    return null;
  }

  // VALIDAÇÃO DA SENHA DIGITADA
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo Senha deve ser preenchido.';
    }
    if (value.length < 6) {
      return 'O campo Senha deve conter no mínimo 6 caracteres.';
    }
    if (value != _confirmPasswordController.text) {
      return 'As senhas digitadas não estão coerentes.';
    }
    return null;
  }

// VALIDAÇÃO DA SENHA REESCRITA
  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo Reescreva a senha deve ser preenchido.';
    }
    if (value.length < 6) {
      return 'O campo Reescreva a senha deve conter no mínimo 6 caracteres.';
    }
    if (value != _passwordController.text) {
      return 'As senhas digitadas não estão coerentes.';
    }
    return null;
  }

  // CHAVE GLOBAL PARA O PREENCHIMENTO
  final formKey = GlobalKey<FormState>();

  // BANCO DE DADOS
  final db = DatabaseHelper();

  // CADASTRO DA CONTA
  signUp() async {
    var res = await db.createUser(Users(
      userName: _usernameController.text,
      email: _emailController.text,
      userPassword: _passwordController.text,
    ));
    if (res > 0) {
      if (!mounted) return;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TELA DE CRIAR CONTA
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).scaffoldBackgroundColor
          : backgroundApp,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // TITULO DO APLICATIVO
                Text(
                  "Códex do Programador".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                ),

                // ENTRADA DE DADOS CAMPO NOME
                FieldComponent(
                  hint: 'Fulano Ciclano',
                  controller: _usernameController,
                  label: 'Nome',
                  validator: _validateUsername,
                  icon: const Icon(Icons.person),
                  textInputType: TextInputType.text,
                ),

                // ENTRADA DE DADOS CAMPO E-MAIL
                FieldComponent(
                  controller: _emailController,
                  label: 'E-mail',
                  validator: _validateEmail,
                  hint: 'fulanociclano@email.com',
                  textInputType: TextInputType.emailAddress,
                  icon: const Icon(Icons.email_rounded),
                ),

                // ENTRADA DE DADOS CAMPO SENHA
                PasswordField(
                  controller: _passwordController,
                  label: 'Senha',
                  hint: '1234',
                  validator: _validatePassword,
                ),

                // ENTRADA DE DADOS CAMPO REESCREVA A SENHA
                PasswordField(
                  controller: _confirmPasswordController,
                  label: 'Confirme a senha',
                  hint: '1234',
                  validator: _validateConfirmPassword,
                ),

                // ESPAÇO ENTRE OS COMPONENTES
                espacoComponentes,

                // Botão CADASTRAR
                ButtonComponent(
                  text: 'Cadastrar'.toUpperCase(),
                  color: appLogo,
                  callBack: () {
                    if (formKey.currentState!.validate()) {
                      signUp();
                    }
                  },
                ),

                espacoComponentes,

                // Botão CONTA EXISTENTE
                Row(
                  children: [
                    Text(
                      'Já possui uma conta?',
                      style: TextStyle(
                          fontSize:
                              provider.Provider.of<FontSizeConfig>(context)
                                  .fontSize),
                    ),

                    // BOTÃO PARA VOLTAR
                    LetterButtonComponent(
                      text: 'Logar'.toUpperCase(),
                      callBack: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
