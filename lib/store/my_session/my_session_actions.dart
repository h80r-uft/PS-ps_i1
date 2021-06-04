import 'package:ps_i1/middlewares/navigation/navigation_actions.dart';
import 'package:ps_i1/models/student.dart';
import 'package:redux/redux.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'package:ps_i1/models/user.dart';

import 'package:ps_i1/pages/pages.dart';

import 'package:ps_i1/services/session/user_service.dart';

import 'package:ps_i1/store/app_state.dart';

firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

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
class LoadingAction {
  /// Estado de login.
  final bool loading;

  /// Erro obtido ao entrar.
  final String? loadingError;
  LoadingAction({
    required this.loading,
    this.loadingError,
  });
}

void Function(Store<AppState>) saveThunk(UserService userService) {
  return (Store<AppState> store) {
    store.dispatch(LoadingAction(loading: true));

    final state = store.state.mySessionState;

    userService.login(state.email, state.password).then((user) {
      store.dispatch(SessionStart(user!));
      store.dispatch(NavigateReplace(
        user is Student ? '/grade' : '/new_student',
      ));
      store.dispatch(LoadingAction(loading: false));
    }).onError((error, stackTrace) {
      store.dispatch(LoadingAction(
        loading: false,
        loadingError: error.toString(),
      ));
    });
  };
}
