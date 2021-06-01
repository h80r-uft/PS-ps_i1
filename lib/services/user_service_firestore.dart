// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../models/user.dart';
import '../models/teacher.dart';
import '../models/student.dart';
import '../models/user_service.dart';
import '../models/teacher.dart';
import '../models/student.dart';

firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

const db = FirebaseFirestore;

final userCollection = FirebaseFirestore.instance.collection("users");

User fromDocumentSnapshot(DocumentSnapshot doc) {
  final data = doc.data();
  if (data == null || !(data is Map)) throw "DocumentSnapshot data error!";
  return User(
    uid: doc.id,
    name: data['name'],
    isTeacher: data['isTeacher'],
  );
}

class UserServiceFirestore extends UserService {
  @override
  Future<User?> login(String email, String password) async {
    firebaseAuth
        .signInWithEmailAndPassword(email: "login", password: "senha")
        .then((userCredential) {
      // Signed in
      print("Logado!");
      print(userCredential);
      userCollection.doc(userCredential.user!.uid).get().then((doc) {
        User user = fromDocumentSnapshot(doc);
        //Encontrou
        print("Encontrou doc");
        return user;
      }).catchError((error) {
        print("Erro ao buscar documento: ");
        print(error);
      });
    }).catchError((error) {
      // Error
      print(Error);
    });
    return null;
  }

  @override
  Future<void> logout(User user) async {
    firebaseAuth.signOut().then((user) {
      print("saiu");
    }).catchError((Error) {
      print("erro ao sair");
      print(Error);
    });
  }
}
