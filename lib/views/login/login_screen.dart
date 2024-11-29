import 'package:dictionary/controllers/controllers.dart';
import 'package:dictionary/models/models.dart';
import 'package:dictionary/views/views.dart';
import 'package:dictionary/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/utils/constants.dart';
import 'package:flutter/services.dart';
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

  // VERIFICAR SE ESTÁ LOGADO
  bool isLoginTrue = false;

  // BANCO DE DADOS
  late final dbHelper = Provider.of<DatabaseHelper>(context, listen: false);

  // FUNÇÃO LOGIN PARA VERIFICAÇÃO DOS DADOS
  login() async {
    var response = await dbHelper.authenticate(
      Users(
        email: emailController.text,
        userPassword: passwordController.text,
      ),
    );
    if (response == true) {
      // SALVAR O USUÁRIO LOGADO ATRAVÉS DO SHARED PREFERENCES
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      await userProvider.saveUserData(
          emailController.text, passwordController.text);
      await userProvider.loadUserData();

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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        reverse: true,
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
                      fontSize: Provider.of<FontSizeConfig>(context).fontSize),
                ),

                // LOGOTIPO DO APP
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
                spaceColumn,

                // TEXTO E BOTÃO PERSONALIZADO PARA CRIAR CONTA
                CustomLetter(
                  message: 'Não possui conta?',
                  text: 'Criar conta'.toUpperCase(),
                  // DIRECIONAR PARA O CADASTRAMENTO DA CONTA
                  callBack: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountCreatePage()),
                    );
                  },
                ),

                // ESPAÇO ENTRE OS COMPONENTES
                spaceColumn,

                // BOTÃO LOGAR
                CustomButton(
                    text: "Logar".toUpperCase(),
                    callBack: () async {
                      // e-mail e senha estão corretos
                      if (formKey.currentState!.validate()) {
                        await login();
                      }
                    }),

                // ESPAÇO ENTRE OS COMPONENTES
                spaceColumn,

                // MENSAGEM CASO O E-MAIL E/OU SENHA FORAM PREENCHIDAS INCORRETAMENTE
                isLoginTrue
                    ? const Text(
                        "O(s) campo(s) E-mail ou Senha estão incorretos",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 2,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : const SizedBox(),

                // OPÇÃO PARA SAIR DO APLICATIVO
                CustomExit(
                  message: 'Você tem certeza que deseja sair do aplicativo?',
                  callBack: () {
                    Navigator.pop(context, true);
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
            ),
          ),
        ),
      ),
    );
  }
}
