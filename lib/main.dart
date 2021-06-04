// Abaixo serão importados os pacotes relevantes
// a esta página do código.
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:ps_i1/pages/pages.dart' as pages;
import 'package:ps_i1/theme/theme.dart' as theme;

import 'package:ps_i1/keys.dart';

import 'package:ps_i1/store/app_state.dart';
import 'package:ps_i1/store/app_store.dart' show createAppStore;

/// Esta é a função principal, responsável por
/// executar o aplicativo.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
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
        return pages.Loading();
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
  const MyNewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: createAppStore(),
      child: MaterialApp(
        theme: theme.purplePlanning(),
        navigatorKey: Keys.navigationKey,
        initialRoute: "/",
        routes: {
          "/": (context) {
            return const pages.MySession();
          },
          "/login": (context) {
            return const pages.MySession();
          },
          "/new_student": (context) {
            return const pages.NewUser();
          },
          "/grade": (context) {
            return const pages.Grades();
          }
        },
      ),
    );
  }
}
