// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:ps_i1/models/student.dart';
import 'package:ps_i1/models/teacher.dart';

import 'package:ps_i1/models/user.dart';
import 'package:ps_i1/services/session/user_service.dart';

firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

const db = FirebaseFirestore;

final userCollection = FirebaseFirestore.instance.collection("users");

User fromDocumentSnapshot(DocumentSnapshot doc) {
  final data = doc.data();

  if (data == null || data is! Map) throw "DocumentSnapshot data error!";

  final user = User(uid: doc.id, name: data['name']);

  return data['isTeacher']
      ? Teacher(user)
      : Student(
          user,
          firstGrade: data['firstGrade'],
          secondGrade: data['secondGrade'],
        );
}

class UserServiceFirestore extends UserService {
  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      try {
        final docSnapshot =
            await userCollection.doc(userCredential.user!.uid).get();
        print(userCredential);

        return fromDocumentSnapshot(docSnapshot);
      } catch (error2) {
        print("Erro ao buscar documento: ");
        print(error2);
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  @override
  Future<void> logout(User user) async {
    firebaseAuth.signOut().then((user) {
      print("saiu");
    }).catchError((error) {
      print("erro ao sair");
      print(error);
    });
  }
}
