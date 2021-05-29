// Abaixo serão importados os pacotes relevantes
// a esta página do código.
import 'package:flutter/material.dart';
import 'package:ps_i1/view/widgets/number_input.dart';
import 'package:ps_i1/view/widgets/ps_button.dart';
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
        // Definir cor primária, usada para contraste contra o fundo
        primaryColor: Color(0xff731FA1),

        // Definir cor de Scaffold, usada como cor de fundo
        scaffoldBackgroundColor: Color(0xff291C30),

        //Definir fonte padrão do app
        fontFamily: 'Nunito Regular',
      ),
      home: const MyHomePage(
        title: 'Exemplo',
      ),
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
    /// Resolução do dispositivo.
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
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
          PsButton(
              size: size,
              text: 'Abrir',
              func: () {
                setState(() {
                  name = "Gabriel Gomes Carvalho";
                });
                _showPersistentBotton!();
              })
        ],
      ),
    );
  }
}
