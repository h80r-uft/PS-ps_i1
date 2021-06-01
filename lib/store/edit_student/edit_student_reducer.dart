import 'package:ps_i1/store/edit_student/edit_student_actions.dart';
import 'package:ps_i1/store/edit_student/edit_student_state.dart';

/// Executa a [action] atribuída gerando um
/// novo estado partindo do [state] original.
///
/// ### Possíveis ações
///
/// - [FirstGradeChange]
/// - [SecondGradeChange]
/// - [Saving]
EditStudentState editStudentReducer(EditStudentState state, dynamic action) {
  if (action is FirstGradeChange) {
    return state.copyWith(
      firstGrade: action.firstGrade,
    );
  }
  if (action is SecondGradeChange) {
    return state.copyWith(
      secondGrade: action.secondGrade,
    );
  }
  if (action is Saving) {
    return state.copyWith(
      saving: action.saving,
      savingError: action.savingError,
    );
  }
  return state;
}
