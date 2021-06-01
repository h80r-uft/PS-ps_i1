/// Estado atual da adição de um novo estudante.
class AddStudentState {
  /// Nome completo do novo estudante.
  final String name;

  /// Erro obtido ao tentar salvar o
  /// nome do estudante.
  final String? nameError;

  /// Email do novo estudante.
  final String email;

  /// Erro obtido ao tentar salvar o
  /// email do estudante.
  final String? emailError;

  /// Senha do novo estudante.
  final String password;

  /// Erro obtido ao tentar salvar a
  /// senha do estudante.
  final String? passwordError;

  /// Confirmação de senha do estudante.
  final String confirmPassword;

  /// Erro obtido ao tentar salvar a
  /// confirmação de senha do estudante.
  final String? confirmPasswordError;

  /// Estado de salvamento do novo
  /// cadastro.
  final bool saving;

  /// Erro obtido ao tentar salvar
  /// o novo cadastro.
  final String? savingError;

  /// Gerador de estado da criação
  /// do novo estudante.
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

  /// Gerador do estado inicial para
  /// cadastro de novos estudantes.
  factory AddStudentState.initial() {
    return AddStudentState(
      name: '',
      email: '',
      password: '',
      confirmPassword: '',
      saving: false,
    );
  }

  /// Gera o novo estado através
  /// de um [AddStudentState] original
  /// e os atributos que se deseja modificar.
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
