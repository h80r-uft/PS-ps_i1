import 'package:redux/redux.dart';

import 'package:ps_i1/services/services.dart';
import 'package:ps_i1/store/my_session/my_session_actions.dart';
import 'package:ps_i1/store/app_state.dart';

class MySessionViewModel {
  final String uid;
  final String? uidError;
  final String email;
  final String? emailError;
  final String password;
  final String? passwordError;
  final bool isTeacher;
  final String? isTeacherError;
  final bool loading;
  final String? loadingError;

  final void Function(String) onUidChanged;
  final void Function(String) onEmailChanged;
  final void Function(String) onPasswordChanged;
  final void Function(bool) onIsTeacherChanged;
  final void Function(String, String) onLoad;

  MySessionViewModel({
    required this.uid,
    required this.uidError,
    required this.email,
    required this.emailError,
    required this.password,
    required this.passwordError,
    required this.isTeacher,
    required this.isTeacherError,
    required this.loading,
    required this.loadingError,
    required this.onUidChanged,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onIsTeacherChanged,
    required this.onLoad,
  });

  factory MySessionViewModel.fromStore(Store<AppState> store) {
    print("FACTORY MySessionViewModel");
    return MySessionViewModel(
      uid: store.state.mySessionState.uid,
      uidError: store.state.mySessionState.uidError,
      email: store.state.mySessionState.email,
      emailError: store.state.mySessionState.emailError,
      password: store.state.mySessionState.password,
      passwordError: store.state.mySessionState.passwordError,
      isTeacher: store.state.mySessionState.isTeacher,
      isTeacherError: store.state.mySessionState.isTeacherError,
      loading: store.state.mySessionState.loading,
      loadingError: store.state.mySessionState.loadingError,
      onUidChanged: (String uid) => store.dispatch(UidChange(uid)),
      onEmailChanged: (String email) => store.dispatch(EmailChange(email)),
      onPasswordChanged: (String password) =>
          store.dispatch(PasswordChange(password)),
      onIsTeacherChanged: (bool isTeacher) =>
          store.dispatch(IsTeacherChange(isTeacher)),
      onLoad: (String login, String password) =>
          store.dispatch(saveThunk(Services.users, login, password)),
    );
  }
}
