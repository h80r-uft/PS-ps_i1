import 'package:ps_i1/models/user.dart';

/// Abstração dos serviços necessários
/// para o controle do usuário.
abstract class UserService {
  /// Realiza o login do usuário através
  /// de um [email] e [password].
  Future<User?> login(String email, String password);

  /// Realiza o logout através da conta
  /// atualmente logada.
  Future<void> logout(User user);
}
