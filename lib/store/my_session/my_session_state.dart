import 'package:ps_i1/models/user.dart';

/// Estado atual da sessão.
class MySessionState {
  /// Usuário logado.
  final User? user;

  /// Erro obtido ao tentar
  /// fazer login.
  final String? userError;

  /// Email do usuário que
  /// deseja fazer login.
  ///
  /// Este atributo é temporário,
  /// e só permanece na memória
  /// enquanto o login não foi
  /// finalizado.
  final String? email;

  /// Erro obtido ao tentar
  /// armazenar temporariamente
  /// o email.
  final String? emailError;

  /// Senha do usuário que
  /// deseja fazer login.
  ///
  /// Este atributo é temporário,
  /// e só permanece na memória
  /// enquanto o login não foi
  /// finalizado.
  final String? password;

  /// Erro obtido ao tentar
  /// armazenar temporariamente
  /// a senha.
  final String? passwordError;

  /// Estado de carregamento
  /// do login.
  final bool loading;

  /// Erro obtido ao tentar
  /// finalizar o login.
  final String? loadingError;

  /// Gerador de estado da
  /// sessão do usuário.
  MySessionState({
    required this.user,
    this.userError,
    required this.email,
    this.emailError,
    required this.password,
    this.passwordError,
    required this.loading,
    this.loadingError,
  });

  /// Gerador do estado inicial
  /// para a sessão do usuário.
  factory MySessionState.initial() {
    return MySessionState(
      user: null,
      email: null,
      password: null,
      loading: false,
    );
  }

  /// Gera o novo estado através
  /// de um [MySessionState] original
  /// e os atributos que se deseja
  /// modificar.
  MySessionState copyWith({
    User? user,
    String? userError,
    String? email,
    String? emailError,
    String? password,
    String? passwordError,
    bool? loading,
    String? loadingError,
  }) {
    return MySessionState(
      user: user ?? this.user,
      userError: userError ?? this.userError,
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
      password: password ?? this.password,
      passwordError: passwordError ?? this.passwordError,
      loading: loading ?? this.loading,
      loadingError: loadingError ?? this.loadingError,
    );
  }
}
