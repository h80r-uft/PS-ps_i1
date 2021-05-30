import 'package:ps_i1/store/students/students_actions.dart';
import 'package:ps_i1/store/students/students_state.dart';

StudentsState studentsReducer(StudentsState state, dynamic action) {
  if (action is Loading) {
    return state.copyWith(
      loading: action.loading,
      loadingError: action.loadingError,
    );
  }
  return state;
}
