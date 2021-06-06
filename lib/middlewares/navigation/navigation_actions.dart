/// Através do [routeName] realiza
/// a navegação entre rotas.
class NavigateTo {
  /// Nome da rota de destino.
  final String routeName;
  NavigateTo(this.routeName);
}

/// Através do [routeName] substitui
/// a tela atual pela tela de destino.
class NavigateReplace {
  /// Nome da rota de destino.
  final String routeName;
  NavigateReplace(this.routeName);
}

/// Retorna à posição anterior
/// nas rotas do aplicativo.
class NavigateBack {}
