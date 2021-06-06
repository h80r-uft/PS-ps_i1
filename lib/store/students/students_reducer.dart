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
    final student = state.students[action.index];
    return state.copyWith(
      isEditing: true,
      firstGrade: student.firstGrade.toString(),
      secondGrade: student.secondGrade.toString(),
      editedStudent: student,
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
