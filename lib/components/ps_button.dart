import 'package:flutter/material.dart';

/// Botão estilizado
class PsButton extends StatelessWidget {
  /// Texto presente no centro do [PsButton].
  final String text;

  /// Função que será executada quando pressionado.
  final dynamic func;
  const PsButton({
    Key? key,
    required this.size,
    required this.text,
    required this.func,
  }) : super(key: key);

  /// Tamanho da tela em que o [PsButton]
  /// se apresenta.
  final Size size;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: func,
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.05,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3.5),
          borderRadius: BorderRadius.circular(size.width * 0.07),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
