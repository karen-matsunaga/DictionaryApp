import 'package:dictionary/JsonModels/users.dart';
import 'package:dictionary/SQLite/dbhelper.dart';
import 'package:dictionary/homepage/homepage_page.dart';
import 'package:dictionary/widgets/button.dart';
import 'package:dictionary/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/style.dart';
import 'package:dictionary/authentication/signup_page.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/provider/fontsize_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // VISUALIZAÇÃO DA SENHA
  bool isVisible = false;

  // CONTROLADORES
  final email = TextEditingController();
  final password = TextEditingController();
  final username = TextEditingController();
  final teste = TextEditingController();

  // VERIFICAR SE ESTÁ LOGADO
  bool isLoginTrue = false;

  // BANCO DE DADOS
  final db = DatabaseHelper();

  // FUNÇÃO LOGIN PARA VERIFICAÇÃO DOS DADOS
  login() async {
    // Users? userDetails = await db.getUser(username.text);
    var response = await db.login(
      Users(
        userName: username.text,
        email: email.text,
        userPassword: password.text,
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

  // VALIDAÇÃO DA SENHA
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
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
                Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: appLogo,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0.0, 4.0),
                        blurRadius: 4.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    // CONTROLADOR E-MAIL
                    controller: email,
                    style: TextStyle(
                        fontSize: provider.Provider.of<FontSizeConfig>(context)
                            .fontSize),
                    // ICONE
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email_rounded),
                        border: InputBorder.none,
                        labelText: "E-mail",
                        hintText: "fulanociclano@email.com"),
                    validator: (value) {
                      // CAMPO E-MAIL VAZIO
                      if (value!.isEmpty) {
                        return "Obrigatório preencher o campo E-mail";
                      }
                      return null;
                    },
                  ),
                ),

                // ENTRADA DE DADOS CAMPO SENHA
                PasswordField(
                    controller: password,
                    label: 'Senha',
                    validator: _validatePassword),

                const SizedBox(height: 20),

                // BOTÃO LOGAR
                Button(
                    text: "Logar".toUpperCase(),
                    callBack: () {
                      if (formKey.currentState!.validate()) {
                        login();
                      }
                    }),

                const SizedBox(height: 10),

                // BOTÃO CRIAR CONTA
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // TEXTO NÃO POSSUI CONTA
                    Text(
                      "Não possui conta?",
                      style: TextStyle(
                        fontSize: provider.Provider.of<FontSizeConfig>(context)
                                .fontSize /
                            1.25,
                        letterSpacing: 1,
                      ),
                    ),

                    // ESPAÇAMENTO ENTRE OS TEXTOS
                    const SizedBox(
                      width: 10,
                    ),

                    // TEXTO SIGN UP
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountCreatePage()),
                        );
                      },
                      child: Text(
                        'Criar conta'.toUpperCase(),
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize:
                              provider.Provider.of<FontSizeConfig>(context)
                                      .fontSize /
                                  1.50,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? appLogo
                              : Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),

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

                // **FIM DA COLUNA**
              ],
            ),
          ),
        ),
      ),
    );
  }
}
