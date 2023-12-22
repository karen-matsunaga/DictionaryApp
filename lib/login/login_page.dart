// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:dictionary/style.dart';
// import 'package:dictionary/utils/constants.dart';
// import 'package:dictionary/utils/snackbar_extension.dart';
import 'package:dictionary/login/signup_page.dart';
import 'package:dictionary/login/password_recovery_page.dart';
import 'package:dictionary/search/homepage_page.dart';
import 'package:provider/provider.dart' as provider;
import 'package:dictionary/provider/fontsize-provider.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // bool _signInLoading = false;
  // GlobalKey<FormState> _formKey = GlobalKey();
  // late TextEditingController _emailController;
  // late TextEditingController _passwordController;

  // @override
  // void initState() {
  //   super.initState();
  //   _emailController = TextEditingController();
  //   _passwordController = TextEditingController();
  // }

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  // void _signIn() async {
  //   final isValid = _formKey.currentState?.validate();

  //   if (isValid != null && isValid) {
  //     setState(() {
  //       _signInLoading = true;
  //     });

  //     try {
  //       await client.auth.signInWithPassword(
  //         email: _emailController.text,
  //         password: _passwordController.text,
  //       );

  //       setState(() {
  //         _signInLoading = false;
  //       });

  //       _navigateToDashboard();
  //     } on AuthException catch (e) {
  //       context.showSnackbar(message: e.message, backgroundColor: Colors.red);
  //       setState(() {
  //         _signInLoading = false;
  //       });
  //     } catch (e) {
  //       context.showSnackbar(
  //           message: e.toString(), backgroundColor: Colors.red);
  //       setState(() {
  //         _signInLoading = false;
  //       });
  //     }
  //   }
  // }

  // void _navigateToDashboard() {
  //   Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(builder: (_) => const HomeSearchPage()),
  //     (route) => false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).scaffoldBackgroundColor
          : backgroundApp,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            // key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // if (_signInLoading) ...[
                //   const Center(
                //     child: CircularProgressIndicator.adaptive(),
                //   ),
                // ],
                // TÍTULO DO APLICATIVO
                Text(
                  "Códex do Programador",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                ),

                // LOGO DO APLICATIVO
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.all(20),
                  child: Center(
                    child: Image.asset(
                      'images/Logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey
                          : appLogo,
                      borderRadius: BorderRadius.circular(10)),
                ),

                // CAMPO E-MAIL
                // Row(
                //   children: [
                //     Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
                //     Text(
                //       'E-mail',
                //       style: TextStyle(
                //           fontSize:
                //               Provider.of<FontSizeConfig>(context).fontSize),
                //       textAlign: TextAlign.left,
                //     ),
                //   ],
                // ),

                // ENTRADA DE DADOS CAMPO E-MAIL
                Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  // controller: _emailController,
                  style: TextStyle(
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                  decoration: InputDecoration(
                      labelText: 'E-mail', hintText: 'fulanociclano@email.com'),
                  validator: (value) {
                    // CAMPO E-MAIL VAZIO
                    if (value == null || value.isEmpty) {
                      return 'Obrigatório preencher o campo E-mail';
                    }
                    return null;
                  },
                  // decoration: InputDecoration(
                  //   labelText: 'E-mail',
                  //   border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //     borderSide: BorderSide.none,
                  //   ),
                  //   hintText: 'fulanociclano@email.com',
                  //   filled: true,
                  //   fillColor: Theme.of(context).brightness == Brightness.dark
                  //       ? campoescuro
                  //       : campoclaro,
                  // ),
                ),

                // CAMPO SENHA
                // Row(
                //   children: [
                //     Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
                //     Text(
                //       'Senha',
                //       style: TextStyle(
                //           fontSize:
                //               Provider.of<FontSizeConfig>(context).fontSize),
                //       textAlign: TextAlign.left,
                //     ),
                //   ],
                // ),

                // ENTRADA DE DADOS CAMPO SENHA
                Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),

                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  // controller: _passwordController,
                  obscureText: true,
                  style: TextStyle(
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                  decoration:
                      InputDecoration(labelText: 'Senha', hintText: 'Senha'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Obrigatório preencher o campo Senha';
                    }
                    if (value.length < 4) {
                      return 'Preencher mínimo 4 caracteres no campo Senha';
                    }
                    return null;
                  },

                  // decoration: InputDecoration(
                  //   labelText: 'Senha',
                  //   border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide.none),
                  //   hintText: 'Senha',
                  // filled: true,
                  // fillColor: Theme.of(context).brightness == Brightness.dark
                  //     ? campoescuro
                  //     : campoclaro,
                  // ),
                ),

                // BOTÃO LOGAR
                Padding(padding: EdgeInsets.only(bottom: 20, top: 25)),
                FilledButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(5))),
                    backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).brightness == Brightness.dark
                          ? buttonDark
                          : buttonLight,
                    ),
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 40)),
                    textStyle: MaterialStatePropertyAll(
                      TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeSearchPage(),
                      ),
                    );
                  },
                  // onPressed: _signInLoading ? null : _signIn,
                  child: Text(
                    style: TextStyle(
                        fontSize: provider.Provider.of<FontSizeConfig>(context)
                            .fontSize),
                    'Logar',
                  ),
                ),

                // _signInLoading
                //     ? const Center(child: CircularProgressIndicator())
                //     : Column(
                //         children: [
                //           Padding(
                //               padding: EdgeInsets.only(bottom: 20, top: 25)),
                //           TextButton(
                //             style: TextButton.styleFrom(
                // textStyle: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     color: Theme.of(context).brightness ==
                //             Brightness.dark
                //         ? Colors.white
                //         : Colors.black),
                // backgroundColor: Theme.of(context).brightness ==
                //         Brightness.dark
                //     ? buttonDark
                //     : buttonLight,
                // padding: EdgeInsets.symmetric(horizontal: 40),
                //             ),
                //             onPressed: () async {
                //               final isValid = _formKey.currentState?.validate();

                //               if (isValid != true) {
                //                 return;
                //               }

                //               // final res = _signInLoading(
                //               //     email: _emailController,
                //               //     password: _passwordController);

                //               // res.then(() {
                //               //   _emailController.clear();
                //               //   _passwordController.clear();
                //               // });

                //               setState(() {
                //                 _signInLoading = true;
                //               });

                //               try {
                //                 await client.auth.signInWithPassword(
                //                     email: _emailController.text,
                //                     password: _passwordController.text);
                //               } catch (e) {
                //                 ScaffoldMessenger.of(context).showSnackBar(
                //                   const SnackBar(
                //                     content: Text(
                //                         'Falha no Login campo(s) E-mail ou Senha errada(s)'),
                //                     backgroundColor: Colors.redAccent,
                //                   ),
                //                 );
                //                 setState(() {
                //                   _signInLoading = false;
                //                 });
                //               }
                //             },
                //             // Navigator.push(
                //             //   context,
                //             //   MaterialPageRoute(
                //             //       builder: (context) => const HomeSearchPage()),
                //             // );
                //             child: Text('Logar',
                //                 style: TextStyle(
                // fontSize:
                //     provider.Provider.of<FontSizeConfig>(
                //             context)
                //         .fontSize)),
                //           ),
                //         ],
                //       ),

                // BOTÃO CRIAR CONTA
                Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black),
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? buttonDarkOne
                              : buttonLightOne,
                      padding: EdgeInsets.symmetric(horizontal: 40)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountCreatePage()),
                    );
                  },
                  child: Text('Criar conta',
                      style: TextStyle(
                          fontSize:
                              provider.Provider.of<FontSizeConfig>(context)
                                  .fontSize)),
                ),

                // Botão ESQUECEU A SENHA?
                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? buttonDarkOne
                                : buttonLightOne,
                        padding: EdgeInsets.symmetric(horizontal: 40),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PasswordPage()),
                        );
                      },
                      child: Text('Esqueceu a senha?',
                          style: TextStyle(
                              fontSize:
                                  provider.Provider.of<FontSizeConfig>(context)
                                      .fontSize)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
