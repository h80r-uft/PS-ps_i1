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

  /// Gerador do estado da lista
  /// de estudantes.
  StudentsState({
    required this.students,
    required this.loading,
    this.loadingError,
  });

  /// Gerador do estado inicial da
  /// lista de estudantes.
  factory StudentsState.initial() {
    return StudentsState(
      students: <Student>[],
      loading: false,
    );
  }

  /// Gera um novo estado através de um
  /// [StudentsState] original e os
  /// atributos que se deseja modificar.
  StudentsState copyWith({
    List<Student>? students,
    bool? loading,
    String? loadingError,
  }) {
    return StudentsState(
      students: students ?? this.students,
      loading: loading ?? this.loading,
      loadingError: loadingError ?? this.loadingError,
    );
  }
}
