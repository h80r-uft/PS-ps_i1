import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:ps_i1/pages/login/login_view_model.dart';

firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _tedLogin = TextEditingController();
  final _tedSenha = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fazer o Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
      decoration: const InputDecoration(
        labelText: "Login",
        hintText: "Informe o login",
      ),
    );
  }

  Container containerButton(BuildContext context) {
    return Container(
      height: 40.0,
      margin: const EdgeInsets.only(top: 10.0),
      child: OutlinedButton(
        child: const Text(
          "Login",
        ),

        /// A função signIn loga um(a) usuário(a) no sistema, com base nos dados do Firestone
        onPressed: LoginViewModel.navigateToLogin,
      ),
    );
  }

  TextFormField textFormFieldSenha() {
    return TextFormField(
      controller: _tedSenha,
      validator: _validaSenha,
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        labelText: "Senha",
        hintText: "Informe a senha",
      ),
    );
  }
/*
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
            title: const Text("Erro"),
            content: const Text("Login e/ou Senha invalido(s)"),
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
}*/

/*
void signIn(BuildContext context, login, senha) async {
  firebaseAuth
      .signInWithEmailAndPassword(email: login, password: senha)
      .then((userCredential) {
    // Signed in
    showAlertDialog(context, "LOGADO!", login);
    print(userCredential.user);
  }).catchError((error) {
    showAlertDialog(context, "NÃO LOGADO!", error.message);
  });
}*/

// A função abaixo não está funcionado por razões desconhecidas!
// A verificação do login está sendo feita através de msgs no terminal
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
  }
}
