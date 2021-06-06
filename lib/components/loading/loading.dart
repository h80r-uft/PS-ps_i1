import 'package:flutter/material.dart';

import 'package:ps_i1/theme/theme.dart' as theme;

/// Página de carregamento na inicialização.
///
/// Expõe o estado da conexão através de texto.
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  /// Obtido através do `future` da conexão,
  /// utilizado para indicar o erro.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.purplePlanning(),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
