import 'package:redux/redux.dart';

import 'package:ps_i1/services/services.dart';
import 'package:ps_i1/store/app_state.dart';
import 'package:ps_i1/store/my_session/my_session_actions.dart';

/// Modelo de visualização pro login.
class MySessionViewModel {
  /// Email do usuário.
  final String email;

  /// Erro ao tentar inserir o email do usuário.
  final String? emailError;

  /// Senha do usuário.
  ///
  /// Este valor é temporário e removido do estado
  /// da aplicação após o login.
  final String password;

  /// Erro ao tentar inserir a senha.
  final String? passwordError;

  /// Identifica se o usuário quer ver a senha.
  final bool isObscured;

  /// Identifica se o login está sendo efetuado.
  final bool loading;

  /// Erro obtido ao tentar fazer login.
  final String? loadingError;

  /// Envia o email inserido ao estado.
  final void Function(String) onEmailChanged;

  /// Envia a senha inserida ao estado.
  final void Function(String) onPasswordChanged;

  /// Altera a visibilidade da senha.
  final void Function() onObscure;

  /// Realiza o login.
  final void Function() onLoad;

  MySessionViewModel({
    required this.email,
    required this.emailError,
    required this.password,
    required this.passwordError,
    required this.isObscured,
    required this.loading,
    required this.loadingError,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onObscure,
    required this.onLoad,
  });

  /// Aplica os valores do estado no [MySessionViewModel].
  factory MySessionViewModel.fromStore(Store<AppState> store) {
    return MySessionViewModel(
      email: store.state.mySessionState.email,
      emailError: store.state.mySessionState.emailError,
      password: store.state.mySessionState.password,
      passwordError: store.state.mySessionState.passwordError,
      isObscured: store.state.mySessionState.isObscured,
      loading: store.state.mySessionState.loading,
      loadingError: store.state.mySessionState.loadingError,
      onEmailChanged: (String email) => store.dispatch(EmailChange(email)),
      onPasswordChanged: (String password) =>
          store.dispatch(PasswordChange(password)),
      onObscure: () => store.dispatch(Obscure()),
      onLoad: () => store.dispatch(saveThunk(Services.users)),
    );
  }
}
