import 'package:redux/redux.dart';

import 'package:ps_i1/services/services.dart';
import 'package:ps_i1/store/app_state.dart';
import 'package:ps_i1/store/my_session/my_session_actions.dart';

class MySessionViewModel {
  final String email;
  final String? emailError;
  final String password;
  final String? passwordError;
  final bool isObscured;
  final bool loading;
  final String? loadingError;

  final void Function(String) onEmailChanged;
  final void Function(String) onPasswordChanged;
  final void Function() onObscure;
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
