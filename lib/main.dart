// Abaixo serão importados os pacotes relevantes
// a esta página do código.
import 'package:flutter/material.dart';
import 'view/students/widgets/students_item.dart';

/// Esta é a função principal, responsável por
/// executar o aplicativo.
void main() {
  runApp(const MyApp());
}

/// Controla o fluxo do aplicativo
/// 
/// Define o `title` do aplicativo, a `ThemeData`
/// aplicada neste, e também inicializa o fluxo
/// de páginas através da `home`
class MyApp extends StatelessWidget {
  /// Construtor do controle de fluxo
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Exemplo',),
    );
  }
}

/// Página principal do aplicativo
/// 
/// Possui um título, e um texto central.
class MyHomePage extends StatelessWidget {
  /// Título aplicado à `AppBar`
  final String title;

  /// Gera o widget com um [title]
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Resolução do dispositivo.
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
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
