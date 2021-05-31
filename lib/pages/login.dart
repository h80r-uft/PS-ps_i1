import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

class LoginPage extends StatelessWidget {
  final _tedLogin = TextEditingController();
  final _tedSenha = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fazer o Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _body(context),
      ),
    );
  }

  String? _validaLogin(String? text) {
    if (text!.isEmpty) {
      return "Informe o login";
    }
    return null;
  }

  String? _validaSenha(String? text) {
    if (text!.isEmpty) {
      return "Informe a senha";
    }
    return null;
  }

  _body(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            textFormFieldLogin(),
            textFormFieldSenha(),
            containerButton(context)
          ],
        ));
  }

  TextFormField textFormFieldLogin() {
    return TextFormField(
      controller: _tedLogin,
      validator: _validaLogin,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: "Login",
        labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        hintText: "Informe o login",
      ),
    );
  }

  Container containerButton(BuildContext context) {
    return Container(
      height: 40.0,
      margin: EdgeInsets.only(top: 10.0),
      child: RaisedButton(
        color: Colors.deepPurple,
        child: Text("Login",
            style: TextStyle(color: Colors.white, fontSize: 20.0)),
        onPressed: () {
          _onClickLogin(context);
        },
      ),
    );
  }

  TextFormField textFormFieldSenha() {
    return TextFormField(
        controller: _tedSenha,
        validator: _validaSenha,
        obscureText: true,
        keyboardType: TextInputType.text,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: "Senha",
            labelStyle: TextStyle(fontSize: 20.0, color: Colors.white),
            hintText: "Informe a senha"));
  }

  _onClickLogin(BuildContext context) {
    final login = _tedLogin.text;
    final senha = _tedSenha.text;

    print("Login: $login , Senha: $senha ");

    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (login.isEmpty || senha.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Erro"),
              content: Text("Login e/ou Senha invalido(s)"),
              actions: <Widget>[
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
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
void signIn(context, login, senha) async {
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

// A função abaixo não está funcionado por razões desconhecidas!
// A verificação do login está sendo feita através de msgs no terminal
showAlertDialog(context, title_text, content_text) {
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
      title_text,
    ),
    content: Text(
      content_text,
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
}
