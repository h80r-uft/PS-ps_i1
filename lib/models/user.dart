/// Modelo para a criação de usuários.
///
/// É um modelo genérico, que armazena
/// o nome e o código único do usuário.
class User {
<<<<<<< HEAD
  final String? uid;
  final String? name;
  final String? isTeacher;
=======
  /// Nome completo do usuário.
  final String name;

  /// Código de identificação único
  /// do usuário.
  final String uid;
>>>>>>> develop

  User({required this.uid, required this.name, required this.isTeacher});
}
