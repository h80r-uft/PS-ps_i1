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
