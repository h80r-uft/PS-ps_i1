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
