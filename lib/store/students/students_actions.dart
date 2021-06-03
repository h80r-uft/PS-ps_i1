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
