// NumberInput
import 'package:flutter/material.dart';

/// Widget para entrada de valores numéricos
class NumberInput extends StatelessWidget {
  /// Controlador que mantém o texto atual
  /// presente no [NumberInput].
  final TextEditingController controller;

  /// Frase ou palavra que indicam o tipo
  /// de entrada esperado.
  final String text;

  const NumberInput({
    Key? key,
    required this.size,
    required this.controller,
    required this.text,
  }) : super(key: key);

  /// Tamanho da tela em que o [NumberInput]
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
        keyboardType: TextInputType.number,
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
