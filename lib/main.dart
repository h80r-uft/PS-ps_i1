import 'package:flutter/material.dart';

import 'view/widgets/text_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // takes the dimensions of the device
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: TextInput(
          size: size,
          text: "E-mail",
          controller: textController,
        ),
      ),
    );
  }
}
