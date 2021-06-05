// Import the firebase_core and cloud_firestore plugin
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:ps_i1/services/add_student/add_student_service.dart';

firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

/*
final userCollection = FirebaseFirestore.instance.collection("users");

User fromDocumentSnapshot(String name, String email, String password) {
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
}*/

class AddStudentServiceFirestore extends AddStudentService {
  @override
  Future<void> register(String name, String email, String password) async {
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((cred) {
      try {
        FirebaseFirestore.instance.collection("users").doc(cred.user!.uid).set({
          "isTeacher": false,
          "name": name,
        });
      } catch (error2) {
        print("Erro ao add doc user: ");
        print(error2);
      }
    }).onError((error, stackTrace) {
      print("Erro ao criar user");
      print(error);
    });
    print("-------------------------");
    print("EMAIL DO USER ATUAL:");
    print(firebaseAuth.currentUser!.email);
    return null;
  }
}
