import 'package:flutter/material.dart';

class Grade extends StatelessWidget {
  final double grade;
  final String title;
  final Color color;

  const Grade({
    Key? key,
    required this.grade,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      initialValue: grade.toString(),
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        labelText: title,
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 5,
            color: color,
          ),
        ),
      ),
    );
  }
}
