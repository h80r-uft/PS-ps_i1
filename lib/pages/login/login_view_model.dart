import 'package:redux/redux.dart';

import 'package:ps_i1/store/my_session/my_session_actions.dart';

import 'package:ps_i1/store/app_state.dart';

class LoginViewModel {
  final String email;
  final Function(String) onEmailChange;

  final String password;
  final Function(String) onPasswordChange;

  final Function() recoverPassword;
  final Function() login;

  final String? loginError;

  const LoginViewModel({
    required this.email,
    required this.onEmailChange,
    required this.password,
    required this.onPasswordChange,
    required this.recoverPassword,
    required this.login,
    required this.loginError,
  });

  factory LoginViewModel.fromStore(Store<AppState> store) {
    final state = store.state.mySessionState;
    return LoginViewModel(
      email: state.email ?? '',
      onEmailChange: (String email) => store.dispatch(EmailChange(email)),
      password: state.password ?? '',
      onPasswordChange: (String password) =>
          store.dispatch(PasswordChange(password)),
      recoverPassword: () => {},
      login: () => {},
      loginError: state.loadingError,
    );
  }
}
