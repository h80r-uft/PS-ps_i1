import 'package:ps_i1/store/add_student/add_student_actions.dart';
import 'package:ps_i1/store/add_student/add_student_state.dart';

/// Executa a [action] atribuída gerando um
/// novo estado partindo do [state] original.
///
/// ### Possíveis ações
///
/// - [NameChange]
/// - [EmailChange]
/// - [PasswordChange]
/// - [ConfirmPasswordChange]
/// - [ClearFormData]
/// - [Saving]
AddStudentState addStudentReducer(AddStudentState state, dynamic action) {
  if (action is NameChange) {
    return state.copyWith(
      name: action.name,
    );
  }
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
  if (action is ConfirmPasswordChange) {
    return state.copyWith(
      confirmPassword: action.confirmPassword,
    );
  }
  if (action is ClearFormData) {
    return AddStudentState.initial();
  }
  if (action is Saving) {
    return state.copyWith(
      saving: action.saving,
      savingError: action.savingError,
    );
  }
  return state;
}
