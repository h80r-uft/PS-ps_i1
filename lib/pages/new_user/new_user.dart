import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

class MyInput extends StatelessWidget {
  final String? label;
  final String? hint;
  final bool isPassword;

  const MyInput({
    Key? key,
    required this.label,
    this.hint,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
      ),
      obscureText: isPassword,
    );
  }
}

// Classe de widget que compõe o corpo da página de criar user
class NewUser extends StatelessWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar novo usuário"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: <Widget>[
              const MyInput(
                label: 'Nome',
                hint: 'Informe o nome',
                isPassword: false,
              ),
              const MyInput(
                label: 'E-Mail',
                hint: 'Informe o e-mail',
                isPassword: false,
              ),
              const MyInput(
                label: 'Senha',
                hint: 'Informe a senha',
                isPassword: true,
              ),
              const MyInput(
                label: 'Confirmação',
                hint: 'Confirme a senha',
                isPassword: true,
              ),
              Container(
                height: 40.0,
                margin: const EdgeInsets.only(top: 10.0),
                child: OutlinedButton(
                  child: const Text(
                    "Criar cadastro",
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                height: 40.0,
                margin: const EdgeInsets.only(top: 10.0),
                child: OutlinedButton(
                  child: const Text(
                    "Lista de alunos",
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
