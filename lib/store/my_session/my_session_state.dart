import 'package:flutter/foundation.dart';

@immutable

/// Estado atual da sessão.
class MySessionState {
  /// Numero dentificador
  /// do usuario
  final String uid;
  final String? uidError;

  /// Nome completo do usuário.
  final String name;
  final String? nameError;

  /// Classificador de tipo de usuário
  final bool isTeacher;
  final String? isTeacherError;

  /// Email do usuário que
  /// deseja fazer login.
  ///
  /// Este atributo é temporário,
  /// e só permanece na memória
  /// enquanto o login não foi
  /// finalizado.
  final String email;

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
  final String password;

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
  const MySessionState({
    required this.uid,
    this.uidError,
    required this.name,
    this.nameError,
    required this.email,
    this.emailError,
    required this.password,
    this.passwordError,
    required this.isTeacher,
    this.isTeacherError,
    required this.loading,
    this.loadingError,
  });

  /// Gerador do estado inicial
  /// para a sessão do usuário.
  factory MySessionState.initial() {
    return const MySessionState(
      uid: "",
      name: "",
      isTeacher: false,
      email: "",
      password: "",
      loading: false,
    );
  }

  /// Gera o novo estado através
  /// de um [MySessionState] original
  /// e os atributos que se deseja
  /// modificar.
  copyWith({
    String? uid,
    String? uidError,
    String? name,
    String? nameError,
    String? email,
    String? emailError,
    String? password,
    String? passwordError,
    bool? isTeacher,
    String? isTeacherError,
    bool? loading,
    String? loadingError,
  }) {
    return MySessionState(
      uid: uid ?? this.uid,
      uidError: uidError ?? this.uidError,
      name: name ?? this.name,
      nameError: nameError ?? this.nameError,
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
      password: password ?? this.password,
      passwordError: passwordError ?? this.passwordError,
      isTeacher: isTeacher ?? this.isTeacher,
      isTeacherError: isTeacherError ?? this.isTeacherError,
      loading: loading ?? this.loading,
      loadingError: loadingError ?? this.loadingError,
    );
  }
}
