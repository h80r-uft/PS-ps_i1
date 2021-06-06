import 'package:ps_i1/models/student.dart';

/// Abstração para serviços de controle
/// dos estudantes.
abstract class StudentsService {
  /// Obtem os estudantes do banco de dados.
  Future<List<Student>> listStudents();

  /// Salva as edições de um [student].
  Future<void> saveStudent(Student student);
}
