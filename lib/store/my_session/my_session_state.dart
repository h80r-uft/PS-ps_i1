import 'package:ps_i1/models/user.dart';

class MySessionState {
  final User? user;
  final String? userError;

  final bool loading;
  final String? loadingError;

  MySessionState({
    required this.user,
    this.userError,
    required this.loading,
    this.loadingError,
  });

  factory MySessionState.initial() {
    return MySessionState(
      user: null,
      loading: false,
    );
  }

  MySessionState copyWith({
    User? user,
    String? userError,
    bool? loading,
    String? loadingError,
  }) {
    return MySessionState(
      user: user ?? this.user,
      userError: userError ?? this.userError,
      loading: loading ?? this.loading,
      loadingError: loadingError ?? this.loadingError,
    );
  }
}
