import 'package:redux/redux.dart';

import 'package:ps_i1/models/student.dart';

import 'package:ps_i1/services/services.dart';

import 'package:ps_i1/store/students/students_actions.dart';
import 'package:ps_i1/store/app_state.dart';

/// Modelo de visualização dos estudantes.
class StudentsViewModel {
  /// Estudantes cadastrados.
  final List<Student> students;

  /// Informa se ainda está carregando.
  final bool loading;

  /// Erro obtido ao tentar carregar.
  final String? loadingError;

  /// Abre o editor de nota pro aluno
  /// selecionado.
  final void Function(int) onTapItem;

  /// Informa se está editando.
  final bool isEditing;

  /// Estudante selecionado para edição.
  final Student? editedStudent;

  /// Primeira nota do estudante.
  final String? firstGrade;

  /// Segunda nota do estudante.
  final String? secondGrade;

  /// Salva a primeira nota no estado.
  final void Function(String) onFirstGradeChange;

  /// Salva a segunda nota no estado.
  final void Function(String) onSecondGradeChange;

  /// Salva as edições feita.
  final void Function() onSave;

  /// Informa se está salvando
  final bool saving;

  /// Erro obtido ao salvar edição.
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

  /// Aplica os valores do estado no [StudentsViewModel].
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
