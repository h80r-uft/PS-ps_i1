import 'package:redux/redux.dart';

import 'package:ps_i1/models/student.dart';

import 'package:ps_i1/services/services.dart';

import 'package:ps_i1/store/students/students_actions.dart';
import 'package:ps_i1/store/app_state.dart';

class StudentsViewModel {
  final List<Student> students;

  final bool loading;
  final String? loadingError;

  final void Function(int) onTapItem;

  final bool isEditing;
  final Student? editedStudent;
  final String? firstGrade;
  final String? secondGrade;

  final void Function(String) onFirstGradeChange;
  final void Function(String) onSecondGradeChange;

  final void Function() onSave;

  final bool saving;
  final String? savingError;

  const StudentsViewModel({
    required this.students,
    required this.loading,
    required this.loadingError,
    required this.onTapItem,
    required this.isEditing,
    required this.editedStudent,
    required this.firstGrade,
    required this.secondGrade,
    required this.onFirstGradeChange,
    required this.onSecondGradeChange,
    required this.onSave,
    required this.saving,
    required this.savingError,
  });

  factory StudentsViewModel.fromStore(Store<AppState> store) {
    final state = store.state.studentsState;

    return StudentsViewModel(
      students: state.students,
      loading: state.loading,
      loadingError: state.loadingError,
      onTapItem: (int index) => store.dispatch(OnTapItem(index: index)),
      isEditing: state.isEditing,
      editedStudent: state.editedStudent,
      firstGrade:
          state.firstGrade ?? state.editedStudent?.firstGrade.toString(),
      secondGrade:
          state.secondGrade ?? state.editedStudent?.secondGrade.toString(),
      onFirstGradeChange: (String grade) =>
          store.dispatch(FirstGradeChange(grade: grade)),
      onSecondGradeChange: (String grade) =>
          store.dispatch(SecondGradeChange(grade: grade)),
      onSave: () => store.dispatch(saveThunk(Services.students)),
      saving: state.saving,
      savingError: state.savingError,
    );
  }
}
