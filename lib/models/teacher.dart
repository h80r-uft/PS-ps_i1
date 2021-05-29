import 'package:ps_i1/models/user.dart';

class Teacher extends User {
  Teacher(User user) : super(name: user.name, uid: user.uid);
}
