import 'package:ps_i1/models/user.dart';

class MySessionState {
  final User? user;
  final String? userError;

  final String? email;
  final String? emailError;

  final String? password;
  final String? passwordError;

  final bool loading;
  final String? loadingError;

  MySessionState({
    required this.user,
    this.userError,
    required this.email,
    this.emailError,
    required this.password,
    this.passwordError,
    required this.loading,
    this.loadingError,
  });

  factory MySessionState.initial() {
    return MySessionState(
      user: null,
      email: null,
      password: null,
      loading: false,
    );
  }

  MySessionState copyWith({
    User? user,
    String? userError,
    String? email,
    String? emailError,
    String? password,
    String? passwordError,
    bool? loading,
    String? loadingError,
  }) {
    return MySessionState(
      user: user ?? this.user,
      userError: userError ?? this.userError,
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
      password: password ?? this.password,
      passwordError: passwordError ?? this.passwordError,
      loading: loading ?? this.loading,
      loadingError: loadingError ?? this.loadingError,
    );
  }
}
