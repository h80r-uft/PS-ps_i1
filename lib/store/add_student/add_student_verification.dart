import 'package:email_validator/email_validator.dart';

/// Verifica:
/// - Validade do email
/// - Força da senha
/// - Correspondência entre senhas
bool verify(String email, String password, String confirmPassword) {
  if (!EmailValidator.validate(email)) {
    print("Email inválido!");
    return false;
  } else if (password != confirmPassword) {
    print("As duas senhas não são correspondentes!");
    return false;
  } else if (password.length < 6) {
    print("Senha deve ter ao menos 6 dígitos");
    return false;
  }

  return true;
}
