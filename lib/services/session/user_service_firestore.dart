// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:ps_i1/models/student.dart';
import 'package:ps_i1/models/teacher.dart';

import 'package:ps_i1/models/user.dart';
import 'package:ps_i1/services/session/user_service.dart';

/// Instância de autenticação do firebase.
firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

const db = FirebaseFirestore;

/// Coleção de usuários presente no banco
/// de dados.
final userCollection = FirebaseFirestore.instance.collection("users");

/// Gera um usuário a partir do [doc], uma
/// [DocumentSnapshot].
User fromDocumentSnapshot(DocumentSnapshot doc) {
  final data = doc.data();

  if (data == null || data is! Map) throw 'DocumentSnapshot data error!';

  final user = User(uid: doc.id, name: data['name']);

  return data['isTeacher']
      ? Teacher(user)
      : Student(
          user,
          firstGrade: data['firstGrade'],
          secondGrade: data['secondGrade'],
        );
}

/// Serviços necessários para manutenção
/// do estado de login.
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

        return fromDocumentSnapshot(docSnapshot);
      } catch (error) {
        // ignore: avoid_print
        print('Erro ao buscar documento: ' + error.toString());
      }
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
    return null;
  }

  @override
  Future<void> logout(User user) async {
    firebaseAuth.signOut().catchError((error) {
      // ignore: avoid_print
      print('Erro ao sair: ' + error.toString());
    });
  }
}
