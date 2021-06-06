import 'package:ps_i1/services/session/user_service_firestore.dart';
import 'package:ps_i1/services/students/students_service_firestore.dart';

/// Mantém os serviços necessários
/// para funcionamento do aplicativo.
class Services {
  /// Serviços relacionados à login
  /// e logout.
  static final users = UserServiceFirestore();

  /// Serviços relacionados à edição
  /// e listagem de estudantes.
  static final students = StudentsServiceFirestore();
}
