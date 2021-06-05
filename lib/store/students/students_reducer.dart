import 'package:ps_i1/store/students/students_actions.dart';
import 'package:ps_i1/store/students/students_state.dart';

/// Executa a [action] atribuída gerando um
/// novo estado partindo do [state] original.
///
/// ### Possíveis ações
///
/// - [Loading]
StudentsState studentsReducer(StudentsState state, dynamic action) {
  if (action is Loading) {
    return state.copyWith(
      loading: action.loading,
      loadingError: action.loadingError,
    );
  }
  if (action is OnStudentsChange) {
    return state.copyWith(
      students: action.students,
    );
  }
  if (action is OnTapItem) {
    return state.copyWith(
      isEditing: true,
      editedStudent: state.students[action.index],
    );
  }
  if (action is FirstGradeChange) {
    return state.copyWith(
      firstGrade: action.grade,
    );
  }
  if (action is SecondGradeChange) {
    return state.copyWith(
      secondGrade: action.grade,
    );
  }
  if (action is Saving) {
    return state.copyWith(
      editedStudent: null,
      isEditing: false,
      saving: action.saving,
      savingError: action.savingError,
    );
  }
  return state;
}
