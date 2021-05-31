// TextInput
import 'package:flutter/material.dart';

/// Widget para entrada de texto
class TextInput extends StatelessWidget {
  /// Controlador que mantém o texto atual
  /// presente no [TextInput].
  final TextEditingController controller;

  /// Frase ou palavra que indicam o tipo
  /// de entrada esperado.
  final String text;

  const TextInput({
    Key? key,
    required this.size,
    required this.controller,
    required this.text,
  }) : super(key: key);

  /// Tamanho da tela em que o [TextInput]
  /// se apresenta.
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.05,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(size.width * 0.015)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: text,
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
          contentPadding: EdgeInsets.only(left: 10),
        ),
      ),
    );
  }
}
