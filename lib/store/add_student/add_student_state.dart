class AddStudentState {
  final String name;
  final String? nameError;

  final String email;
  final String? emailError;

  final String password;
  final String? passwordError;

  final String confirmPassword;
  final String? confirmPasswordError;

  final bool saving;
  final String? savingError;

  AddStudentState({
    required this.name,
    this.nameError,
    required this.email,
    this.emailError,
    required this.password,
    this.passwordError,
    required this.confirmPassword,
    this.confirmPasswordError,
    required this.saving,
    this.savingError,
  });

  factory AddStudentState.initial() {
    return AddStudentState(
        name: '', email: '', password: '', confirmPassword: '', saving: false);
  }

  AddStudentState copyWith({
    String? name,
    String? nameError,
    String? email,
    String? emailError,
    String? password,
    String? passwordError,
    String? confirmPassword,
    String? confirmPasswordError,
    bool? saving,
    String? savingError,
  }) {
    return AddStudentState(
      name: name ?? this.name,
      nameError: nameError ?? this.nameError,
      email: email ?? this.email,
      emailError: emailError ?? this.emailError,
      password: password ?? this.password,
      passwordError: passwordError ?? this.passwordError,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      saving: saving ?? this.saving,
      savingError: savingError ?? this.savingError,
    );
  }
}
