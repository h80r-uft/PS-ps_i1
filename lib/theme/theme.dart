import 'package:flutter/material.dart';

/// Tema roxo
ThemeData purplePlanning() {
  /// Cor primária.
  const primaryColor = Color(0xff731FA1);

  /// Cor secundária.
  const secondaryColor = Color(0xff291C30);

  /// Fonte de texto padrão;
  const fontFamily = 'NunitoRegular';

  return ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: secondaryColor,
    fontFamily: fontFamily,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primaryColor,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        primary: Colors.white,
        side: const BorderSide(
          color: Colors.white,
          width: 3.0,
        ),
        textStyle: const TextStyle(
          fontFamily: fontFamily,
          fontSize: 20.0,
        ),
        padding: const EdgeInsets.all(
          12.0,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      hintStyle: TextStyle(
        color: Colors.grey.shade600,
        fontSize: 12.0,
      ),
    ),
  );
}
