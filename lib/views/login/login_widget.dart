import 'package:dictionary/controllers/user_provider.dart';
import 'package:dictionary/models/users.dart';
import 'package:dictionary/views/home/homepage_widget.dart';
import 'package:dictionary/views/login/custom_pass_widget.dart';
import 'package:dictionary/views/login/logo_widget.dart';
import 'package:dictionary/views/login/signup_widget.dart';
import 'package:dictionary/models/dbhelper.dart';
import 'package:dictionary/views/login/custom_button_widget.dart';
import 'package:dictionary/views/login/custom_form_widget.dart';
import 'package:dictionary/views/login/custom_msg_widget.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/controllers/fontsize_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // CONTROLADORES
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  // VERIFICAR SE ESTÁ LOGADO
  bool isLoginTrue = false;

  // BANCO DE DADOS
  final db = DatabaseHelper();

  // FUNÇÃO LOGIN PARA VERIFICAÇÃO DOS DADOS
  login() async {
    var response = await db.authenticate(
      Users(
        // userName: usernameController.text,
        email: emailController.text,
        userPassword: passwordController.text,
      ),
    );
    if (response == true) {
      // SHARED PREFERENCES
      // ignore: use_build_context_synchronously
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      await userProvider.saveUserData(
          usernameController.text, emailController.text);
      // SE OS DADOS ESTIVEREM CORRETOS
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
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

// TELA DE LOGIN
  @override
  Widget build(BuildContext context) {
    // TELA DE LOGIN
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
                      fontWeight: FontWeight.bold,
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                ),

                const LogoApp(),

                // ENTRADA DE DADOS CAMPO E-MAIL
                CustomForm(
                  controller: emailController,
                  label: 'E-mail',
                  validator: _validateEmail,
                  hint: 'fulanociclano@email.com',
                  textInputType: TextInputType.emailAddress,
                  icon: const Icon(Icons.email_rounded),
                ),

                // ENTRADA DE DADOS CAMPO SENHA
                PasswordForm(
                  controller: passwordController,
                  label: 'Senha',
                  validator: _validatePassword,
                  hint: '123456',
                ),

                // ESPAÇAMENTO DOS COMPONENTES
                espacoComponentes,

                // BOTÃO LOGAR
                CustomButton(
                    text: "Logar".toUpperCase(),
                    color: buttonLight,
                    callBack: () async {
                      // e-mail e senha estão corretos
                      if (formKey.currentState!.validate()) {
                        await login();
                      }
                    }),

                // ESPAÇO ENTRE OS COMPONENTES
                espacoComponentes,

                // TEXTO E BOTÃO PERSONALIZADO PARA CRIAR CONTA
                CustomLetter(
                  message: 'Não possui conta?',
                  text: 'Criar conta'.toUpperCase(),
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
                        "O(s) campo(s) E-mail ou Senha estão incorretos",
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
