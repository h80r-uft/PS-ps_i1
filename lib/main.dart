import 'package:flutter/material.dart';
import 'view/students/widgets/students_item.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StudentItem(
            size: size,
            fullName: "Heitor Galdino",
            status: 2,
          ),
          StudentItem(
            size: size,
            fullName: "Gabriel Gomes Carvalho",
            status: 1,
          ),
        ],
      ),
    );
  }
}
