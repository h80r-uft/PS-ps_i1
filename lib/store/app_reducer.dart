import 'package:ps_i1/store/app_state.dart';

import 'package:ps_i1/store/add_student/add_student_reducer.dart';
import 'package:ps_i1/store/my_session/my_session_reducer.dart';
import 'package:ps_i1/store/students/students_reducer.dart';

/// Executa a [action] atribuída gerando um
/// novo estado partindo do [state] original.
AppState appReducer(AppState state, dynamic action) {
  return AppState(
    addStudentState: addStudentReducer(state.addStudentState, action),
    mySessionState: mySessionReducer(state.mySessionState, action),
    studentsState: studentsReducer(state.studentsState, action),
  );
}
