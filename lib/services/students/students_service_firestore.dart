// Import the firebase_core and cloud_firestore plugin
import 'package:ps_i1/models/student.dart';
import 'package:ps_i1/services/session/user_service_firestore.dart';
import 'package:ps_i1/services/students/students_service.dart';

/// Serviços necessários para controle
/// dos estudantes.
class StudentsServiceFirestore extends StudentsService {
  @override
  Future<List<Student>> listStudents() async {
    return userCollection
        .where(
          'isTeacher',
          isEqualTo: false,
        )
        .get()
        .then((collection) => collection.docs
            .map((doc) => fromDocumentSnapshot(doc) as Student)
            .toList());
  }

  @override
  Future<void> saveStudent(Student student) async {
    userCollection.doc(student.uid).update(
      {
        'firstGrade': student.firstGrade,
        'secondGrade': student.secondGrade,
      },
    );
  }
}
