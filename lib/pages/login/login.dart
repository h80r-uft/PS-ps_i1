import 'package:flutter/material.dart';
import 'package:ps_i1/pages/responsive.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  /// variavel usada para obscurecer ou não a entranda do input password
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fazer Login'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildEmailField(size: size),
            buildPasswordField(size: size),
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: (Responsive.isMobile(context)) ? size.width * 0.8 : 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: (Responsive.isMobile(context))
                        ? size.width * 0.35
                        : 135,
                    height: 20,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        primary: Colors.grey,
                      ),
                      child: const Text(
                        'Esqueci a senha',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  /*TextButton(
                    onPressed: () {},
                    child: Container(
                      width: (Responsive.isMobile(context))
                          ? size.width * 0.3
                          : 150,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          'Esqueci a senha',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )*/
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: (Responsive.isMobile(context)) ? size.width * 0.8 : 400,
              height: 40,
              margin: const EdgeInsets.only(top: 20),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Entrar',
                ),
              ),
            )
          ],
        ));
  }

  Center buildEmailField({required Size size}) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        width: (Responsive.isMobile(context)) ? size.width * 0.8 : 400,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              left: 5,
              bottom: 10,
            ),
            border: InputBorder.none,
            hintText: 'E-mail',
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Center buildPasswordField({required Size size}) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: (Responsive.isMobile(context)) ? size.width * 0.8 : 400,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          /// responsavel por obscurecer ou exibir a senha digitada
          obscureText: !_showPassword,
          keyboardType: TextInputType.text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              left: 5,
              top: 2.5,
            ),
            border: InputBorder.none,
            hintText: 'Senha',
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 18,
            ),

            /// Botão usado para mudar o estado da variavel _showPassword
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  (_showPassword == false)
                      ? _showPassword = true
                      : _showPassword = false;
                });
              },
              icon: Icon(
                (_showPassword) ? Icons.visibility_off : Icons.visibility,
                size: 18,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
