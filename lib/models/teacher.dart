import 'package:ps_i1/models/user.dart';

/// Modelo para a criação de professores.
class Teacher extends User {
  Teacher(User user)
      : super(name: user.name, uid: user.uid, isTeacher: user.isTeacher);
}
