// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously

import 'package:dictionary/login/signup_account_page.dart';
import 'package:flutter/material.dart';
import 'package:dictionary/style.dart';
// import 'package:dictionary/utils/constants.dart';
// import 'package:dictionary/utils/snackbar_extension.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// import 'package:dictionary/login/dictionary-confirmationaccount.dart';
import 'package:dictionary/login/login_page.dart';

import 'package:provider/provider.dart' as provider;
import 'package:dictionary/provider/fontsize-provider.dart';

class AccountCreatePage extends StatefulWidget {
  const AccountCreatePage({Key? key}) : super(key: key);

  @override
  State<AccountCreatePage> createState() => _AccountCreatePageState();
}

class _AccountCreatePageState extends State<AccountCreatePage> {
  // bool _signUpLoading = false;
  // final GlobalKey<FormState> _formKey = GlobalKey();
  // late TextEditingController _emailController;
  // late TextEditingController _passwordController;
  // late TextEditingController _nameController;
  // late TextEditingController _lastnameController;
  // late TextEditingController _rewritepasswordController;

  // @override
  // void initState() {
  //   super.initState();

  //   _emailController = TextEditingController(text: "");
  //   _passwordController = TextEditingController(text: "");
  //   _nameController = TextEditingController(text: "");
  //   _lastnameController = TextEditingController(text: "");
  //   _rewritepasswordController = TextEditingController(text: "");
  // }

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   _nameController.dispose();
  //   _lastnameController.dispose();
  //   _rewritepasswordController.dispose();
  //   super.dispose();
  // }

  // void _signUp() async {
  //   final isValid = _formKey.currentState?.validate();

  //   if (isValid != null && isValid) {
  //     try {
  //       setState(() {
  //         _signUpLoading = true;
  //       });

  //       final isEmailExist = await client
  //           .from('perfil')
  //           .select('email')
  //           .eq('email', _emailController.text)
  //           .limit(1)
  //           .maybeSingle();

  //       if (isEmailExist != null &&
  //           isEmailExist['email'].toString().isNotEmpty) {
  //         throw const AuthException('E-mail existente');
  //       }

  //       final isUserNameExist = await client
  //           .from('perfil')
  //           .select('usuario')
  //           .eq('usuario', _nameController.text)
  //           .limit(1)
  //           .maybeSingle();

  //       if (isUserNameExist != null &&
  //           isUserNameExist['usuario'].toString().isNotEmpty) {
  //         throw const AuthException('Usuário usado');
  //       }

  //       await client.auth.signUp(
  //           email: _emailController.text,
  //           password: _passwordController.text,
  //           data: {'usuario': _nameController.text.toLowerCase()});

  //       setState(() {
  //         _signUpLoading = false;
  //       });

  //       _navigateToLoginPage();
  //     } on AuthException catch (e) {
  //       context.showSnackbar(message: e.message, backgroundColor: Colors.red);
  //       setState(() {
  //         _signUpLoading = false;
  //       });
  //     } catch (e) {
  //       context.showSnackbar(
  //           message: e.toString(), backgroundColor: Colors.red);
  //       setState(() {
  //         _signUpLoading = false;
  //       });
  //     }
  //   }
  // }

  // void _navigateToLoginPage() {
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (_) => const LoginPage()));
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
              children: [
                // if (_signUpLoading) ...[
                //   const Center(
                //     child: CircularProgressIndicator.adaptive(),
                //   )
                // ],

                // TITULO DO APLICATIVO
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

                // CAMPO NOME
                // Row(
                //   children: [
                //     Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
                //     Text(
                //       'Nome',
                //       style: TextStyle(
                //           fontSize:
                //               Provider.of<FontSizeConfig>(context).fontSize),
                //       textAlign: TextAlign.left,
                //     ),
                //   ],
                // ),

                // ENTRADA DE DADOS CAMPO NOME
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  // controller: _nameController,
                  style: TextStyle(
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                  decoration:
                      InputDecoration(labelText: 'Nome', hintText: 'Fulano'),
                  validator: (value) {
                    // CAMPO NOME VAZIO
                    if (value == null || value.isEmpty) {
                      return 'Obrigatório preencher o campo Nome';
                    }
                    final isValid =
                        RegExp(r'^[A-Za-z0-9_]{3,24}$').hasMatch(value);
                    if (!isValid) {
                      return '3-24 long with alphanumeric or underscore';
                    }
                    return null;
                  },

                  // decoration: InputDecoration(
                  //   border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //     borderSide: BorderSide.none,
                  //   ),
                  //   hintText: 'Fulano',
                  //   filled: true,
                  //   fillColor: Theme.of(context).brightness == Brightness.dark
                  //       ? campoescuro
                  //       : campoclaro,
                  // ),
                ),

                // CAMPO SOBRENOME
                // Row(
                //   children: [
                //     Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
                //     Text(
                //       'Sobrenome',
                //       style: TextStyle(
                //           fontSize:
                //               Provider.of<FontSizeConfig>(context).fontSize),
                //       textAlign: TextAlign.left,
                //     ),
                //   ],
                // ),

                // ENTRADA DE DADOS CAMPO SOBRENOME
                // TextFormField(
                //   validator: (value) {
                //     // CAMPO SOBRENOME VAZIO
                //     if (value == null || value.isEmpty) {
                //       return 'Obrigatório preencher o campo Sobrenome';
                //     }
                //     return null;
                //   },
                //   controller: _lastnameController,
                //   style: TextStyle(
                //       fontSize: provider.Provider.of<FontSizeConfig>(context)
                //           .fontSize),
                //   keyboardType: TextInputType.name,
                //   decoration: InputDecoration(
                //       labelText: 'Sobrenome', hintText: 'Ciclano'),
                //   // decoration: InputDecoration(
                //   //   border: OutlineInputBorder(
                //   //     borderRadius: BorderRadius.circular(10),
                //   //     borderSide: BorderSide.none,
                //   //   ),
                //   //   hintText: 'Ciclano',
                //   //   filled: true,
                //   //   fillColor: Theme.of(context).brightness == Brightness.dark
                //   //       ? campoescuro
                //   //       : campoclaro,
                //   // ),
                // ),

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
                    // CAMPO SENHA VAZIO
                    if (value == null || value.isEmpty) {
                      return 'Obrigatório preencher o campo Senha';
                    }
                    // CAMPO SENHA COM MENOS DE 4 CARACTERES
                    if (value.length < 4) {
                      return 'Mínimo de 4 caracteres no campo Senha';
                    }
                    return null;
                  },

                  // decoration: InputDecoration(
                  //   border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide.none),
                  //   hintText: 'Senha',
                  //   filled: true,
                  //   fillColor: Theme.of(context).brightness == Brightness.dark
                  //       ? campoescuro
                  //       : campoclaro,
                  // ),
                ),

                // CAMPO REESCREVA A SENHA
                // Row(
                //   children: [
                //     Padding(padding: EdgeInsets.only(bottom: 20, top: 20)),
                //     Text(
                //       'Reescreva a senha',
                //       style: TextStyle(
                //           fontSize:
                //               Provider.of<FontSizeConfig>(context).fontSize),
                //       textAlign: TextAlign.left,
                //     ),
                //   ],
                // ),

                // ENTRADA DE DADOS CAMPO REESCREVA A SENHA
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  // controller: _rewritepasswordController,
                  obscureText: true,
                  style: TextStyle(
                      fontSize: provider.Provider.of<FontSizeConfig>(context)
                          .fontSize),
                  decoration: InputDecoration(
                      labelText: 'Reescreva a senha',
                      hintText: 'Reescreva a senha'),
                  validator: (value) {
                    // CAMPO REESCREVA A SENHA VAZIO
                    if (value == null || value.isEmpty) {
                      return 'Obrigatório preencher o campo Reescreva a senha';
                    }
                    if (value.length < 4) {
                      return 'Mínimo de 4 caracteres no campo Senha';
                    }
                    return null;
                  },

                  // decoration: InputDecoration(
                  //   border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //       borderSide: BorderSide.none),
                  //   hintText: 'Reescreva a senha',
                  //   filled: true,
                  //   fillColor: Theme.of(context).brightness == Brightness.dark
                  //       ? campoescuro
                  //       : campoclaro,
                  // ),
                ),

                // Botão CADASTRAR
                Padding(padding: EdgeInsets.only(bottom: 20, top: 25)),
                FilledButton(
                  // onPressed: _signUpLoading ? null : _signUp,
                  // child: Text('Cadastrar')),
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
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black),
                      )),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AccountConfirmation(),
                      ),
                    );
                  },
                  // onPressed: _signInLoading ? null : _signIn,
                  child: Text(
                    style: TextStyle(
                        fontSize: provider.Provider.of<FontSizeConfig>(context)
                            .fontSize),
                    'Cadastrar',
                  ),
                ),

                // TextButton(
                //     // onPressed: () {
                //     //   _navigateToLoginPage();
                //     // },
                //     onPressed: () {
                //       Navigator.of(context).push(
                //         MaterialPageRoute(
                //           builder: (context) => LoginPage(),
                //         ),
                //       );
                //     },
                //     child: Text('Conta criada com sucesso!')),

                // _signUpLoading
                //     ? const Center(child: CircularProgressIndicator())
                //     : Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Padding(
                //               padding: EdgeInsets.only(bottom: 20, top: 25)),
                //           TextButton(
                //             style: TextButton.styleFrom(
                //                 textStyle: TextStyle(
                //                     fontWeight: FontWeight.bold,
                //                     color: Theme.of(context).brightness ==
                //                             Brightness.dark
                //                         ? Colors.white
                //                         : Colors.black),
                //                 backgroundColor: Theme.of(context).brightness ==
                //                         Brightness.dark
                //                     ? buttonDark
                //                     : buttonLight,
                //                 padding: EdgeInsets.symmetric(horizontal: 40)),
                //             onPressed: () async {
                //               final isValid = _formKey.currentState?.validate();
                //               if (isValid != true) {
                //                 return;
                //               }
                //               setState(() {
                //                 _signUpLoading = true;
                //                 // Navigator.push(
                //                 //   context,
                //                 //   MaterialPageRoute(
                //                 //       builder: (context) =>
                //                 //           const AccountConfirmation()),
                //                 // );
                //               });

                //               try {
                //                 await client.auth.signInWithPassword(
                //                     email: _emailController.text,
                //                     password: _passwordController.text);

                //                 ScaffoldMessenger.of(context).showSnackBar(
                //                   const SnackBar(
                //                     content: Text(
                //                         'Inscrição realizada com sucesso confirme a sua conta'),
                //                     backgroundColor: Colors.greenAccent,
                //                   ),
                //                 );
                //               } catch (e) {
                //                 ScaffoldMessenger.of(context).showSnackBar(
                //                   const SnackBar(
                //                     content: Text('Falha na Inscrição'),
                //                     backgroundColor: Colors.redAccent,
                //                   ),
                //                 );
                //                 setState(() {
                //                   _signUpLoading = false;
                //                 });
                //               }
                //             },
                //             child: Text('Cadastrar',
                //                 style: TextStyle(
                //                     fontSize:
                //                         provider.Provider.of<FontSizeConfig>(
                //                                 context)
                //                             .fontSize)),
                //           ),
                //         ],
                //       ),

                // Botão VOLTAR
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
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: Text('Voltar',
                      style: TextStyle(
                          fontSize:
                              provider.Provider.of<FontSizeConfig>(context)
                                  .fontSize)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
