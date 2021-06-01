import 'package:ps_i1/models/user.dart';

class MySessionState {
  final String? uid;
  final String? uidError;

  final User? user;
  final String? userError;

  final String? name;
  final String? nameError;

  final String? isTeacher;
  final String? isTeacherError;

  final bool loading;
  final String? loadingError;

  MySessionState({
    required this.uid,
    this.uidError,
    required this.user,
    this.userError,
    required this.name,
    this.nameError,
    required this.isTeacher,
    this.isTeacherError,
    required this.loading,
    this.loadingError,
  });

  factory MySessionState.initial() {
    return MySessionState(
      uid: null,
      name: null,
      user: null,
      isTeacher: null,
      loading: false,
    );
  }

  MySessionState copyWith({
    String? uid,
    String? uidError,
    User? user,
    String? userError,
    String? name,
    String? nameError,
    String? isTeacher,
    String? isTeacherError,
    bool? loading,
    String? loadingError,
  }) {
    return MySessionState(
      uid: uid ?? this.uid,
      uidError: uidError ?? this.uidError,
      user: user ?? this.user,
      userError: userError ?? this.userError,
      name: name ?? this.name,
      nameError: nameError ?? this.nameError,
      isTeacher: isTeacher ?? this.isTeacher,
      isTeacherError: isTeacherError ?? this.isTeacherError,
      loading: loading ?? this.loading,
      loadingError: loadingError ?? this.loadingError,
    );
  }
}
