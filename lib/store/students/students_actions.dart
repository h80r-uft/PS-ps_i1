import 'package:ps_i1/middlewares/navigation/navigation_actions.dart';
import 'package:ps_i1/models/student.dart';
import 'package:ps_i1/services/students/students_service.dart';
import 'package:ps_i1/store/app_state.dart';
import 'package:redux/redux.dart';

/// Ação de carregamento da lista
/// de estudantes.
class Loading {
  /// Estado do carregamento.
  final bool loading;

  /// Erro obtido ao tentar realizar
  /// o carregamento.
  final String? loadingError;

  Loading({
    required this.loading,
    this.loadingError,
  });
}

class OnStudentsChange {
  final List<Student> students;

  OnStudentsChange({required this.students});
}

void Function(Store<AppState>) loadThunk(StudentsService studentsService) {
  return (Store<AppState> store) {
    store.dispatch(Loading(loading: true));

    studentsService.listStudents().then((students) {
      store.dispatch(OnStudentsChange(students: students));
      store.dispatch(Loading(loading: false));
    }).onError((error, stackTrace) {
      store.dispatch(Loading(
        loading: false,
        loadingError: error.toString(),
      ));
    });
  };
}

class OnTapItem {
  final int index;

  OnTapItem({required this.index});
}

class FirstGradeChange {
  final String grade;

  FirstGradeChange({required this.grade});
}

class SecondGradeChange {
  final String grade;

  SecondGradeChange({required this.grade});
}

class Saving {
  final bool saving;
  final String? savingError;

  Saving({required this.saving, this.savingError});
}

void Function(Store<AppState>) saveThunk(StudentsService studentsService) {
  return (Store<AppState> store) {
    store.dispatch(Saving(saving: true));

    final state = store.state.studentsState;
    final student = state.editedStudent!.copyFrom(
      firstGrade: double.tryParse(state.firstGrade ?? '') ?? 0.0,
      secondGrade: double.tryParse(state.secondGrade ?? '') ?? 0.0,
    );

    studentsService.saveStudent(student).then((_) async {
      store.dispatch(Saving(saving: false));
      await Future.delayed(const Duration(milliseconds: 100));
      store.dispatch(NavigateReplace('/students'));
    }).onError((error, stackTrace) {
      store.dispatch(Saving(
        saving: false,
        savingError: error.toString(),
      ));
    });
  };
}
