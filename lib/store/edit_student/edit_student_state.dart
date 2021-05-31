class EditStudentState {
  /// Identificador único do estudante.
  final String uid;

  /// Erro ao obter o identificador único.
  final String? uidError;

  /// Primeira nota do estudante.
  final double firstGrade;

  /// Erro ao obter a primeira nota do
  /// estudante.
  final String? firstGradeError;

  /// Segunda nota do estudante.
  final double secondGrade;

  /// Erro ao obter a segunda nota do
  /// estudante.
  final String? secondGradeError;

  /// Estado de salvamento da edição.
  final bool saving;

  /// Erro obtido ao tentar salvar
  /// as modificações.
  final String? savingError;

  /// Gerador de estado da edição
  /// do estudante.
  EditStudentState({
    required this.uid,
    this.uidError,
    required this.firstGrade,
    this.firstGradeError,
    required this.secondGrade,
    this.secondGradeError,
    required this.saving,
    this.savingError,
  });

  /// Gerador de estado inicial para
  /// edição do estudante.
  factory EditStudentState.initial() {
    return EditStudentState(
      uid: '',
      firstGrade: 0.0,
      secondGrade: 0.0,
      saving: false,
    );
  }

  /// Gera o novo estado através
  /// de um [EditStudentState] original
  /// e os atributos que se deseja modificar.
  EditStudentState copyWith({
    String? uid,
    String? uidError,
    double? firstGrade,
    String? firstGradeError,
    double? secondGrade,
    String? secondGradeError,
    bool? saving,
    String? savingError,
  }) {
    return EditStudentState(
      uid: uid ?? this.uid,
      uidError: uidError ?? this.uidError,
      firstGrade: firstGrade ?? this.firstGrade,
      firstGradeError: firstGradeError ?? this.firstGradeError,
      secondGrade: secondGrade ?? this.secondGrade,
      secondGradeError: secondGradeError ?? this.secondGradeError,
      saving: saving ?? this.saving,
      savingError: savingError ?? this.savingError,
    );
  }
}
