import 'package:flutter/material.dart';

import 'package:ps_i1/theme/theme.dart' as theme;

/// Página de carregamento na inicialização.
///
/// Expõe o estado da conexão através de texto.
class Loading extends StatelessWidget {
  /// Obtido através do `future` da conexão,
  /// utilizado para indicar o erro.
  // final AsyncSnapshot snapshot;
  // const Loading(/*this.snapshot, {Key? key}) : super(key: key*/);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.purplePlanning(),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircularProgressIndicator(
                backgroundColor: Colors.black,
                value: null,
              ),
              const SizedBox(
                height: 20,
              ),
              Text("rrrrrrrroi"),
            ],
          ),
        ),
      ),
    );
  }
}
