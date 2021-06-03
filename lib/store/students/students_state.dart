import 'package:ps_i1/models/student.dart';

/// Estaod atual da lista de estudantes.
class StudentsState {
  /// Lista de todos os estudantes.
  final List<Student> students;

  /// Estado de carregamento dos
  /// estudantes.
  final bool loading;

  /// Erro obtido ao tentar realizar o
  /// carregamento.
  final String? loadingError;

  final bool isEditing;
  final Student? editedStudent;

  final bool saving;
  final String? savingError;

  /// Gerador do estado da lista
  /// de estudantes.
  StudentsState({
    required this.students,
    required this.loading,
    this.loadingError,
    required this.isEditing,
    this.editedStudent,
    required this.saving,
    this.savingError,
  });

  /// Gerador do estado inicial da
  /// lista de estudantes.
  factory StudentsState.initial() {
    return StudentsState(
      students: <Student>[],
      loading: false,
      isEditing: false,
      saving: false,
    );
  }

  /// Gera um novo estado através de um
  /// [StudentsState] original e os
  /// atributos que se deseja modificar.
  StudentsState copyWith({
    List<Student>? students,
    bool? loading,
    String? loadingError,
    bool? isEditing,
    Student? editedStudent,
    bool? saving,
    String? savingError,
  }) {
    return StudentsState(
      students: students ?? this.students,
      loading: loading ?? this.loading,
      loadingError: loadingError ?? this.loadingError,
      isEditing: isEditing ?? this.isEditing,
      editedStudent: editedStudent ?? this.editedStudent,
      saving: saving ?? this.saving,
      savingError: savingError ?? this.savingError,
    );
  }
}
