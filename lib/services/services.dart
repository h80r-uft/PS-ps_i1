import 'package:ps_i1/services/session/user_service_firestore.dart';
import 'package:ps_i1/services/students/students_service_firestore.dart';

class Services {
  static final users = UserServiceFirestore();
  static final students = StudentsServiceFirestore();
}
