import 'package:ps_i1/models/student.dart';

class StudentsState {
  final List<Student> students;
  final bool loading;
  final String? loadingError;

  StudentsState({
    required this.students,
    required this.loading,
    this.loadingError,
  });

  factory StudentsState.initial() {
    return StudentsState(students: <Student>[], loading: false);
  }

  StudentsState copyWith({
    List<Student>? students,
    bool? loading,
    String? loadingError,
  }) {
    return StudentsState(
        students: students ?? this.students,
        loading: loading ?? this.loading,
        loadingError: loadingError ?? this.loadingError);
  }
}
