import 'package:ps_i1/models/user.dart';

class Student extends User {
  final double firstGrade;
  final double secondGrade;

  Student(User user, {required this.firstGrade, required this.secondGrade})
      : super(name: user.name, uid: user.uid);
}
