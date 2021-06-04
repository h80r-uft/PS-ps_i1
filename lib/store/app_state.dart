import 'package:ps_i1/store/add_student/add_student_state.dart';
import 'package:ps_i1/store/edit_student/edit_student_state.dart';
import 'package:ps_i1/store/my_session/my_session_state.dart';
import 'package:ps_i1/store/students/students_state.dart';

/// Estado atual da aplicação.
class AppState {
  /// Estado atual da sessão.
  final MySessionState mySessionState;

  /// Estado atual da lista de estudantes.
  ///
  /// Se o usuário que fez login for um
  /// estudante, esse estado não deve
  /// receber modificações.
  final StudentsState studentsState;

  /// Estado atual da adição de estudantes.
  ///
  /// Se o usuário que fez login for um
  /// estudante, esse estado não deve
  /// receber modificações.
  final AddStudentState addStudentState;

  /// Estado atual da edição de notas de um
  /// estudante.
  ///
  /// Se o usuário que fez login for um
  /// estudante, esse estado não deve
  /// receber modificações.
  final EditStudentState editStudentState;

  /// Gerador de estado da aplicação.
  AppState({
    required this.mySessionState,
    required this.studentsState,
    required this.addStudentState,
    required this.editStudentState,
  });

  /// Gerador do estado inicial
  /// da aplicação.
  factory AppState.inital() {
    return AppState(
      mySessionState: MySessionState.initial(),
      studentsState: StudentsState.initial(),
      addStudentState: AddStudentState.initial(),
      editStudentState: EditStudentState.initial(),
    );
  }
}
