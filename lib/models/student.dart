import 'package:ps_i1/models/user.dart';

/// Modelo para a criação de estudantes.
///
/// Armazena as notas do estudante e seus
/// atributos de identificação.
class Student extends User {
  /// Primeira nota do estudante.
  final double firstGrade;

  /// Segunda nota do estudante.
  final double secondGrade;

  Student(User user, {required this.firstGrade, required this.secondGrade})
      : super(
            name: user.name,
            uid: user.uid,
            isTeacher: user.isTeacher,
            email: user.email,
            password: user.password);
}
