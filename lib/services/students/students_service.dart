import 'package:ps_i1/models/student.dart';

abstract class StudentsService {
  Future<List<Student>> listStudents();
  Future<void> saveStudent(Student student);
}
