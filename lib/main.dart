// Abaixo serão importados os pacotes relevantes
// a esta página do código.
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:ps_i1/components/input/number_input.dart';
import 'package:ps_i1/components/ps_button.dart';

import 'package:ps_i1/pages/pages.dart' as pages;
import 'package:ps_i1/theme/theme.dart' as theme;

/// Esta é a função principal, responsável por
/// executar o aplicativo.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return pages.Error(snapshot);
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return const MyNewApp();
        }
        return pages.Loading(snapshot);
      },
    );
  }
}

/// Controla o fluxo do aplicativo
///
/// Define o `title` do aplicativo, a `ThemeData`
/// aplicada neste, e também inicializa o fluxo
/// de páginas através da `home`
class MyNewApp extends StatelessWidget {
  /// Construtor do controle de fluxo
  const MyNewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.purplePlanning(),
      home: pages.Login(),
    );
  }
}

/// Página principal do aplicativo
///
/// Possui um título, e um texto central.
class MyHomePage extends StatefulWidget {
  /// Título aplicado à `AppBar`
  final String title;

  /// Gera o widget com um [title]
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  VoidCallback? _showPersistentBotton;
  // Controller do TextInput
  TextEditingController _nota1 = TextEditingController();
  TextEditingController _nota2 = TextEditingController();
  // String name seŕa usado pelo Foot
  String name = "";
  @override
  void initState() {
    super.initState();
    _showPersistentBotton = showBottom;
  }

  void showBottom() {
    setState(() {
      _showPersistentBotton = null;
    });

    _scaffoldKey.currentState!
        .showBottomSheet((context) {
          Size size = MediaQuery.of(context).size;
          return Container(
              padding: EdgeInsets.only(top: size.height * 0.02),
              height: size.height * 0.26,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(size.width * 0.1),
                      topRight: Radius.circular(size.width * 0.1))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(),
                  NumberInput(size: size, controller: _nota1, text: 'Nota 1'),
                  NumberInput(size: size, controller: _nota2, text: 'Nota 2'),
                  PsButton(size: size, text: "Salvar", func: () {}),
                ],
              ));
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showPersistentBotton = showBottom;
            });
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
