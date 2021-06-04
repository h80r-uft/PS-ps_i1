import '../models/user.dart';

abstract class UserService {
  Future<User?> login(String email, String password);
  Future<void> logout(User user);
}
