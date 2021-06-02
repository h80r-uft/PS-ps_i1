import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String? message;
  Error(this.message);

  @override
  Widget build(BuildContext context) {
    final message = this.message;
    if (message != null)
      return Center(
        child: Text(message),
      );
    else
      return Container();
  }
}

class TextInput extends StatelessWidget {
  final void Function(String) onChanged;
  final String title;

  TextInput({
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        TextField(
          onChanged: onChanged,
        ),
      ],
    );
  }
}
