import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fazer Login'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                color: Colors.white,
                width: 400,
                height: 35,
                child: TextFormField(
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 8.0),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      hintText: 'Email',
                      hintStyle:
                          TextStyle(color: Colors.black38, fontSize: 16)),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                color: Colors.white,
                width: 400,
                height: 35,
                child: TextFormField(
                  obscureText: true,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 8.0),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      hintText: 'Senha',
                      hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility,
                              size: 18, color: Colors.black45))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 135,
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
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 400,
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
          ),
        ));
  }
}
