import 'package:ps_i1/store/add_student/add_student_state.dart';
import 'package:ps_i1/store/edit_student/edit_student_state.dart';
import 'package:ps_i1/store/my_session/my_session_state.dart';
import 'package:ps_i1/store/students/students_state.dart';

class AppState {
  final MySessionState mySessionState;

  final StudentsState studentsState;
  final AddStudentState addStudentState;
  final EditStudentState editStudentState;

  AppState({
    required this.mySessionState,
    required this.studentsState,
    required this.addStudentState,
    required this.editStudentState,
  });

  AppState.inital()
      : mySessionState = MySessionState.initial(),
        studentsState = StudentsState.initial(),
        addStudentState = AddStudentState.initial(),
        editStudentState = EditStudentState.initial();
}
