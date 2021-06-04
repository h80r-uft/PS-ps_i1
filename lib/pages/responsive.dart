import 'package:flutter/material.dart';

class Responsive {
  /// verifica se o dispositivo é mobile ou não
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 530;
}
