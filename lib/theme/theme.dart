import 'package:flutter/material.dart';

/// Tema roxo
///
/// Define `Nunito Regular` como a [fontFamily],
/// e atribui tons de roxo para [primaryColor] e
/// [scaffoldBackgroundColor].
ThemeData purplePlanning() {
  return ThemeData(
    // Definir cor primária, usada para contraste contra o fundo
    primaryColor: const Color(0xff731FA1),

    // Definir cor de Scaffold, usada como cor de fundo
    scaffoldBackgroundColor: const Color(0xff291C30),

    //Definir fonte padrão do app
    fontFamily: 'NunitoRegular',

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: Colors.white,
        side: const BorderSide(
          color: Colors.white,
          width: 3.0,
        ),
        textStyle: const TextStyle(
          fontFamily: 'NunitoRegular',
          fontSize: 20.0,
        ),
        padding: const EdgeInsets.all(
          12.0,
        ),
      ),
    ),
  );
}
