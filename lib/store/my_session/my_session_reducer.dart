import 'package:ps_i1/store/my_session/my_session_actions.dart';
import 'package:ps_i1/store/my_session/my_session_state.dart';

/// Executa a [action] atribuída gerando um
/// novo estado partindo do [state] original.
///
/// ### Possíveis ações
///
/// - [EmailChange]
/// - [PasswordChange]
/// - [Obscure]
/// - [ClearFormData]
/// - [SessionStart]
/// - [SessionEnd]
/// - [LoadingAction]
MySessionState mySessionReducer(MySessionState state, dynamic action) {
  if (action is EmailChange) {
    return state.copyWith(
      email: action.email,
    );
  }
  if (action is PasswordChange) {
    return state.copyWith(
      password: action.password,
    );
  }
  if (action is Obscure) {
    return state.copyWith(
      isObscured: !state.isObscured,
    );
  }
  if (action is ClearFormData) {
    return state.copyWith(
      email: null,
      password: null,
    );
  }
  if (action is SessionStart) {
    return state.copyWith(user: action.user);
  }
  if (action is SessionEnd) {
    return MySessionState.initial();
  }
  if (action is LoadingAction) {
    return state.copyWith(
      loading: action.loading,
      loadingError: action.loadingError,
    );
  }
  return state;
}
