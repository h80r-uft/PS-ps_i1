/// Modelo para a criação de usuários.
///
/// É um modelo genérico, que armazena
/// o nome e o código único do usuário.
class User {
  /// Nome completo do usuário.
  final String? name;

  /// Código de identificação único
  /// do usuário.
  final String? uid;

  /// Código de classificador
  /// de usuário.
  final bool? isTeacher;

  /// Email de acesso
  /// do usuário.
  final String email;

  /// Senha de acesso
  /// do usuário.
  final String password;

  User(
      {required this.uid,
      required this.name,
      required this.isTeacher,
      required this.email,
      required this.password});
}
