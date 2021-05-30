import 'package:ps_i1/models/user.dart';

class EmailChange {
  final String email;
  EmailChange(this.email);
}

class PasswordChange {
  final String password;
  PasswordChange(this.password);
}

class SessionStart {
  final User user;
  SessionStart(this.user);
}

class ClearFormData {}

class SessionEnd {}

class Loading {
  final bool loading;
  final String? loadingError;
  Loading({
    required this.loading,
    this.loadingError,
  });
}
