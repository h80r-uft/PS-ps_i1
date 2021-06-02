import 'package:ps_i1/models/user.dart';
import 'package:redux/redux.dart';
import '../../models/user.dart';
import '../../models/user_service.dart';
import '../app_state.dart';
import 'package:ps_i1/middlewares/navigation/navigation_actions.dart';

/// Ação de atualização no email.
///
/// Atualiza o estado de [MySession]
/// através do [email] armazenado.
class EmailChange {
  final String email;
  EmailChange(this.email);
}

/// Ação de atualização na senha.
///
/// Atualiza o estado de [MySession]
/// através da [password] armazenada.
class PasswordChange {
  final String password;
  PasswordChange(this.password);
}

/// Ação de inicio de sessão.
///
/// Atualiza o estado de [MySession]
/// através do [user] armazenado.
class SessionStart {
  final User user;
  SessionStart(this.user);
}

/// Ação de limpeza do formulário.
///
/// Limpa as informações de login
/// do estado de [MySession].
class ClearFormData {}

/// Ação de fim de sessão.
///
/// Limpa o estado de [MySession].
class SessionEnd {}

/// Ação de carregamento de usuário.
///
/// Informa o estado de login do
/// usuário através do booleano
/// [loading].
class Loading {
  /// Estado de login.
  final bool loading;

  /// Erro obtido ao entrar.
  final String? loadingError;
  Loading({
    required this.loading,
    this.loadingError,
  });
}

void Function(Store<AppState>) saveThunk(UserService userService) {
  return (Store<AppState> store) {
    store.dispatch(Loading(loading: true));

    final user = User(
      uid: store.state.mySessionState.uid,
      name: store.state.mySessionState.name,
      isTeacher: store.state.mySessionState.isTeacher,
      // email: store.state.mySessionState.email,
      // password: store.state.mySessionState.password,
    );
    userService.login("email", "senha").then((value) {
      store.dispatch(NavigateBack());
    }).onError((error, stackTrace) {
      store.dispatch(Loading(
        loading: false,
        loadingError: error.toString(),
      ));
    });
  };
}

void Function(Store<AppState>) login(
    UserService userService, String email, String password) {
  return (Store<AppState> store) {
    store.dispatch(Loading(
      loading: true,
      loadingError: null,
    ));

    userService.login("email", "senha").then((value) {
      store.dispatch(Loading(
        loading: false,
        loadingError: null,
      ));
    }).onError((error, stackTrace) {
      store.dispatch(Loading(
        loading: false,
        loadingError: error.toString(),
      ));
    });
  };
}
