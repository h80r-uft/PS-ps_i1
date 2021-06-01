/// Ação de atualização da primeira
/// nota.
///
/// Atualiza o estado de [EditStudent]
/// através da [firstGrade] armazenada.
class FirstGradeChange {
  /// Nova primeira nota.
  final double firstGrade;
  FirstGradeChange(this.firstGrade);
}

/// Ação de atualização da segunda
/// nota.
///
/// Atualiza o estado de [EditStudent]
/// através da [secondGrade] armazenada.
class SecondGradeChange {
  /// Nova segunda nota.
  final double secondGrade;
  SecondGradeChange(this.secondGrade);
}

/// Ação de confirmação de edição.
///
/// Confirma a edição das notas do
/// estudante através do booleano [saving].
class Saving {
  /// Estado de salvamento.
  final bool saving;

  /// Erro obtido ao salvar.
  final String? savingError;
  Saving({
    required this.saving,
    this.savingError,
  });
}
