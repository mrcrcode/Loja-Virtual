import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user.manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              key: formKey,
              child: Consumer<UserManager>(
                builder: (_, userManager,  child) {
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(hintText: 'E-mail'),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        validator: (email) {
                          if (!emailValid(email!)) {
                            return 'E-mail inválido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: passController,
                        decoration: const InputDecoration(hintText: 'Senha'),
                        obscureText: true,
                        autocorrect: false,
                        validator: (pass) {
                          if (pass!.isEmpty || pass.length < 6) {
                            return ' Senha Inválida';
                          }
                          return null;
                        },
                        
                      ),
                      child,
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 44,
                        child: ElevatedButton(
                          style: ButtonStyle(backgroundColor:
                              MaterialStateProperty.resolveWith<Color?>(
                                  (states) {
                            return const Color.fromARGB(255, 4, 125, 141);
                          })),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<UserManager>().signIn(
                                  user: User(
                                      email: emailController.text,
                                      password: passController.text),
                                  onFail: (e) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('Falha ao entrar: $e'),
                                      backgroundColor: Colors.red,
                                    ));
                                  },
                                  onSuccess: () {
                                    debugPrint('Sucesso!');
                                    //TODO: FECHAR TELA DE LOGIN
                                  });
                            }
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                 child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Esqueci minha senha',
                            style: TextStyle(
                                color: Color.fromARGB(255, 4, 125, 141)),
                          ),
                        ),
                      ),
              )),
        ),
      ),
    );
  }
}
