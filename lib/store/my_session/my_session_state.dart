import 'package:ps_i1/models/user.dart';

/// Estado atual da sessão.
class MySessionState {
  final String? uid;
  final String? uidError;

  /// Usuário logado.
  final User? user;

  /// Erro obtido ao tentar
  /// fazer login.
  final String? userError;

  final String? name;
  final String? nameError;

  final String? isTeacher;
  final String? isTeacherError;

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
    required this.uid,
    this.uidError,
    required this.user,
    this.userError,
    required this.name,
    this.nameError,
    required this.isTeacher,
    this.isTeacherError,
    required this.loading,
    this.loadingError,
  });

  /// Gerador do estado inicial
  /// para a sessão do usuário.
  factory MySessionState.initial() {
    return MySessionState(
      uid: null,
      name: null,
      user: null,
      isTeacher: null,
      loading: false,
    );
  }

  /// Gera o novo estado através
  /// de um [MySessionState] original
  /// e os atributos que se deseja
  /// modificar.
  MySessionState copyWith({
    String? uid,
    String? uidError,
    User? user,
    String? userError,
    String? name,
    String? nameError,
    String? isTeacher,
    String? isTeacherError,
    bool? loading,
    String? loadingError,
  }) {
    return MySessionState(
      uid: uid ?? this.uid,
      uidError: uidError ?? this.uidError,
      user: user ?? this.user,
      userError: userError ?? this.userError,
      name: name ?? this.name,
      nameError: nameError ?? this.nameError,
      isTeacher: isTeacher ?? this.isTeacher,
      isTeacherError: isTeacherError ?? this.isTeacherError,
      loading: loading ?? this.loading,
      loadingError: loadingError ?? this.loadingError,
    );
  }
}
