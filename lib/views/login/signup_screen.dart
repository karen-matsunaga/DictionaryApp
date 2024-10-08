import 'package:dictionary/models/dbhelper.dart';
import 'package:dictionary/models/users.dart';
import 'package:dictionary/widgets/custom_button_widget.dart';
import 'package:dictionary/widgets/custom_form_widget.dart';
import 'package:dictionary/widgets/custom_msg_widget.dart';
import 'package:dictionary/widgets/custom_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:dictionary/views/login/login_screen.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:dictionary/widgets/custom_pass_widget.dart';

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

  // VERIFICAR SE ESTÁ CADASTRADO
  bool isUserDuplicated = false;

  // VALIDAÇÃO DO NOME
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo Nome deve ser preenchido.';
    }
    final isValid = RegExp(r'^[A-Za-z0-9_]{3,15}$').hasMatch(value);
    if (!isValid) {
      return 'O campo Nome deve conter no mínimo 3 e máximo 15 caracteres.';
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
      return 'O campo Confirmar senha deve ser preenchido.';
    }
    if (value.length < 6) {
      return 'O campo Confirmar senha deve conter no mínimo 6 caracteres.';
    }
    if (value != _passwordController.text) {
      return 'As senhas digitadas não estão coerentes.';
    }
    return null;
  }

  // CHAVE GLOBAL PARA O PREENCHIMENTO
  final formKey = GlobalKey<FormState>();

  // BANCO DE DADOS
  late final dbHelper =
      provider.Provider.of<DatabaseHelper>(context, listen: false);

  // CADASTRO DA CONTA
  signUp() async {
    // VERIFICAR SE O USUÁRIO ESTÁ DUPLICADO
    bool userDuplicated =
        await dbHelper.checkUserDuplicated(_emailController.text);
    // CASO O USUÁRIO ESTÁ DUPLICADO
    if (userDuplicated) {
      setState(() {
        isUserDuplicated = true;
      });
    }

    // CASO O USUÁRIO NÃO ESTÁ DUPLICADO
    else {
      var res = await dbHelper.createUser(Users(
        userName: _usernameController.text,
        email: _emailController.text,
        userPassword: _passwordController.text,
      ));
      if (res > 0) {
        if (!mounted) return;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TELA DE CRIAR CONTA
    return Scaffold(
      // FUNDO DO APLICATIVO
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        reverse: true,
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

                const LogoApp(),

                // ENTRADA DE DADOS CAMPO NOME
                CustomForm(
                  hint: 'Fulano Ciclano',
                  controller: _usernameController,
                  label: 'Nome',
                  validator: _validateUsername,
                  icon: const Icon(Icons.person),
                  textInputType: TextInputType.text,
                ),

                // ENTRADA DE DADOS CAMPO E-MAIL
                CustomForm(
                  controller: _emailController,
                  label: 'E-mail',
                  validator: _validateEmail,
                  hint: 'fulanociclano@email.com',
                  textInputType: TextInputType.emailAddress,
                  icon: const Icon(Icons.email_rounded),
                ),

                // ENTRADA DE DADOS CAMPO SENHA
                PasswordForm(
                  controller: _passwordController,
                  label: 'Senha',
                  hint: '123456',
                  validator: _validatePassword,
                ),

                // ENTRADA DE DADOS CAMPO REESCREVA A SENHA
                PasswordForm(
                  controller: _confirmPasswordController,
                  label: 'Confirmar senha',
                  hint: '123456',
                  validator: _validateConfirmPassword,
                ),

                // ESPAÇO ENTRE OS COMPONENTES
                spaceColumn,

                // Botão CADASTRAR
                CustomButton(
                  text: 'Cadastrar'.toUpperCase(),
                  callBack: () {
                    if (formKey.currentState!.validate()) {
                      signUp();
                    }
                  },
                ),

                // ESPAÇAMENTO ENTRE COMPONENTES
                spaceColumn,

                // TEXTO E BOTÃO PARA CONTA EXISTENTE
                CustomLetter(
                  message: 'Já possui conta?',
                  text: 'Logar'.toUpperCase(),
                  callBack: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),

                // ESPAÇAMENTO ENTRE COMPONENTES
                spaceColumn,

                // MENSAGEM DE ERRO CASO EXISTA O USUÁRIO
                isUserDuplicated
                    ? const Text(
                        "Esse e-mail ou usuário já foi usado tente outro!",
                        style: TextStyle(
                          color: lightErrorColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 2,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
