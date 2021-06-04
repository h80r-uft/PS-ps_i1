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

  User({
    this.uid,
    this.name,
  });
}
