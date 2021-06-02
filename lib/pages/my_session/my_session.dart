import 'package:flutter/material.dart';
import 'package:ps_i1/pages/responsive.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

class MySession extends StatefulWidget {
  @override
  _MySessionState createState() => _MySessionState();
}

class _MySessionState extends State<MySession> {
  /// GlobalKey do formulario
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// variavel usada para obscurecer ou não a entranda do input password
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Fazer Login',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildEmailField(controller: emailController, size: size),
              buildPasswordField(controller: passwordController, size: size),
              Container(
                margin: EdgeInsets.only(top: 8),
                width: (Responsive.isMobile(context)) ? size.width * 0.8 : 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        width: (Responsive.isMobile(context))
                            ? size.width * 0.3
                            : 150,
                        height: 20,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            'Esqueci a senha',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: (Responsive.isMobile(context)) ? size.width * 0.8 : 400,
                height: 40,
                margin: EdgeInsets.only(top: 20),
                child: OutlinedButton(
                  onPressed: () {
                    String login = emailController.text;
                    String password = passwordController.text;

                    /// valida se a entrada é um email valido
                    bool emailValid = RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                        .hasMatch(login);
                    if (login.isNotEmpty && password.isNotEmpty && emailValid) {
                      signIn(context, login, password);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text('Email ou senha invalidos')));
                    }
                  },
                  child: Text(
                    'Entrar',
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Center buildEmailField(
      {required TextEditingController controller, required Size size}) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        width: (Responsive.isMobile(context)) ? size.width * 0.8 : 400,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black, fontSize: 18),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 5, bottom: 10),
            border: InputBorder.none,
            hintText: 'E-mail',
            hintStyle:
                TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 18),
          ),
        ),
      ),
    );
  }

  Center buildPasswordField(
      {required TextEditingController controller, required Size size}) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: (Responsive.isMobile(context)) ? size.width * 0.8 : 400,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          controller: controller,

          /// responsavel por obscurecer ou exibir a senha digitada
          obscureText: !_showPassword,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.black, fontSize: 18),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 5, top: 2.5),
              border: InputBorder.none,
              hintText: 'Senha',
              hintStyle:
                  TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 18),

              /// Botão usado para mudar o estado da variavel _showPassword
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    (_showPassword == false)
                        ? _showPassword = true
                        : _showPassword = false;
                  });
                },
                child: Icon(
                    (_showPassword) ? Icons.visibility_off : Icons.visibility,
                    size: 18,
                    color: Colors.black.withOpacity(0.5)),
              )),
        ),
      ),
    );
  }
}

/// A função signIn loga um(a) usuário(a) no sistema, com base nos dados do Firestone
void signIn(BuildContext context, login, senha) async {
  firebaseAuth
      .signInWithEmailAndPassword(email: login, password: senha)
      .then((userCredential) {
    // Signed in
    showAlertDialog(context, "LOGADO!", login);
    print(" ------------------------------------");
    print(userCredential.user!.uid);
    print(" ------------------------------------");
  }).catchError((error) {
    showAlertDialog(context, "NÃO LOGADO!", "error");
    print(error);
    print("O login não foi concluído :(");
  });
}

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
