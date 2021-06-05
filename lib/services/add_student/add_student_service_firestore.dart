// Import the firebase_core and cloud_firestore plugin
import 'package:firebase/firebase.dart' as firebase;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ps_i1/services/add_student/add_student_service.dart';

/// Conecta com firestore para registro de alunos
class AddStudentServiceFirestore extends AddStudentService {
  @override

  /// Registra estudante a partir de seu nome, email e senha
  Future<void> register(String name, String email, String password) async {
    final secondaryApp = firebase.initializeApp(
        apiKey: "AIzaSyCzzAAm9k4eJr3TqJDl9mGx1lwHRw3zQbw",
        authDomain: "ps-i1-9deca.firebaseapp.com",
        projectId: "ps-i1-9deca",
        storageBucket: "ps-i1-9deca.appspot.com",
        messagingSenderId: "210305718179",
        appId: "1:210305718179:web:3a1555b7ced737cd78ac16",
        measurementId: "G-WV7DC63XJ5",
        name: "Secondary");

    /// Cria uma segunda referência para o Firebase Auth
    await secondaryApp
        .auth()
        .createUserWithEmailAndPassword(email, password)
        .then((cred) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(cred.user!.uid)
          .set({"isTeacher": false, "name": name});
      secondaryApp.auth().signOut();
      secondaryApp.delete();
    }).onError((error, stackTrace) {
      print(error);
    });
    return null;
  }
}
