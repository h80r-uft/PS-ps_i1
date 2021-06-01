import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

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
              TextFormField(
                validator: _validaNome,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  hintText: "Informe o nome",
                ),
              ),
              TextFormField(
                validator: _validaMail,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "E-Mail",
                  hintText: "Informe o e-mail",
                ),
              ),
              TextFormField(
                validator: _validaSenha,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Senha",
                  hintText: "Informe a senha",
                ),
              ),
              TextFormField(
                validator: _validaSenha2,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Confirme a senha",
                ),
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

  // Mensagens de erro que surgem se algum campo estiver vazio
  String? _validaNome(String? text) {
    if (text!.isEmpty) {
      return "Informe o nome";
    }
    return null;
  }

  String? _validaMail(String? text) {
    if (text!.isEmpty) {
      return "Informe o endereço de e-mail";
    }
    return null;
  }

  String? _validaSenha(String? text) {
    if (text!.isEmpty) {
      return "Informe a senha";
    }
    return null;
  }

  String? _validaSenha2(String? text) {
    if (text!.isEmpty) {
      return "Confirme a senha";
    }
    return null;
  }

/*
  _onClickLogin(BuildContext context) {
    final login = _tedNome.text;
    final mail = _tedMail.text;
    final senha = _tedSenha.text;
    final senha2 = _tedSenha2.text;

    print("Login: $login , Mail: $mail , Senha: $senha ($senha2)  ");

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (login.isEmpty || mail.isEmpty || senha.isEmpty || senha2.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Erro"),
            content: const Text("Todos os campos são obrigatórios"),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    } else {
      signIn(
        context,
        login,
        senha,
      );
    }
  }
}

/// A função signIn loga um(a) usuário(a) no sistema, com base nos dados do Firestone
void signIn(BuildContext context, login, senha) async {
  firebaseAuth
      .signInWithEmailAndPassword(email: login, password: senha)
      .then((userCredential) {
    // Signed in
    showAlertDialog(context, "LOGADO!", login);
    print(userCredential.user);
    print(login + " está logade!");
  }).catchError((error) {
    showAlertDialog(context, "NÃO LOGADO!", "error");
    print(error);
    print("O login não foi concluído :(");
  });
}

showAlertDialog(BuildContext context, titleText, contentText) {
  Widget okButton = TextButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: const Text(
      "OK",
    ),
  );

  AlertDialog alerta = AlertDialog(
    title: Text(
      titleText,
    ),
    content: Text(
      contentText,
    ),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (context) {
      return alerta;
    },
  );
*/
}
