import 'package:dictionary/models/users.dart';
import 'package:dictionary/views/login/signup_widget.dart';
import 'package:dictionary/models/dbhelper.dart';
import 'package:dictionary/views/home/homepage_widget.dart';
import 'package:dictionary/views/login/custom_button_widget.dart';
import 'package:dictionary/views/login/custom_field_widget.dart';
import 'package:dictionary/views/login/custom_message_widget.dart';
import 'package:dictionary/views/login/custom_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/controllers/fontsize_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // CONTROLADORES
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  // VERIFICAR SE ESTÁ LOGADO
  bool isLoginTrue = false;

  // BANCO DE DADOS
  final db = DatabaseHelper();

  // FUNÇÃO LOGIN PARA VERIFICAÇÃO DOS DADOS
  login() async {
    // Users? userDetails = await db.getUser(username.text);
    var response = await db.login(
      Users(
        userName: usernameController.text,
        email: emailController.text,
        userPassword: passwordController.text,
      ),
    );
    if (response == true) {
      // SE OS DADOS ESTIVEREM CORRETOS
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeSearchPage(),
        ),
      );
    } else {
      // CASO CONTRÁRIO RETORNARÁ UMA MENSAGEM DE ERRO
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  // CHAVE GLOBAL PARA O FORMULÁRIO DE PREENCHIMENTO
  final formKey = GlobalKey<FormState>();

  // VALIDAÇÃO DO E-MAIL
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo E-mail deve ser preenchido.';
    }

    return null;
  }

  // VALIDAÇÃO DA SENHA
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'O campo Senha deve ser preenchido.';
    }
    if (value.length < 6) {
      return 'O campo Senha deve conter no mínimo 6 caracteres.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
                // TÍTULO DO APLICATIVO
                Text(
                  "Códex do Programador".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                ),

                // ENTRADA DE DADOS CAMPO E-MAIL
                FieldComponent(
                  controller: emailController,
                  label: 'E-mail',
                  validator: _validateEmail,
                  hint: 'fulanociclano@email.com',
                  textInputType: TextInputType.emailAddress,
                  icon: const Icon(Icons.email_rounded),
                ),

                // ENTRADA DE DADOS CAMPO SENHA
                PasswordField(
                  controller: passwordController,
                  label: 'Senha',
                  validator: _validatePassword,
                  hint: '1234',
                ),

                // ESPAÇAMENTO DOS COMPONENTES
                espacoComponentes,

                // BOTÃO LOGAR
                ButtonComponent(
                    text: "Logar".toUpperCase(),
                    color: buttonLight,
                    callBack: () {
                      if (formKey.currentState!.validate()) {
                        login();
                      }
                    }),

                // ESPAÇO ENTRE OS COMPONENTES
                espacoComponentes,

                // TEXTO E BOTÃO PARA CRIAR CONTA
                const LetterButtonComponent(text: 'Não possui conta?'),

                ButtonComponent(
                  text: 'Criar conta',
                  callBack: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountCreatePage()),
                    );
                  },
                ),

                // ESPAÇO ENTRE OS COMPONENTES
                espacoComponentes,

                // MENSAGEM CASO O E-MAIL E/OU SENHA FORAM PREENCHIDAS INCORRETAMENTE
                isLoginTrue
                    ? const Text(
                        "E-mail ou Senha estão incorretos",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
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
