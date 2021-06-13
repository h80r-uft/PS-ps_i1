import 'package:ps_i1/services/services.dart';
import 'package:ps_i1/middlewares/navigation/navigation_actions.dart';
import 'package:redux/redux.dart';
import 'package:ps_i1/store/add_student/add_student_actions.dart';
import 'package:ps_i1/store/app_state.dart';
import 'package:ps_i1/services/add_student/add_student_service_firestore.dart';

/// Modelo de visualização para cadastro
/// de novos usuários.
///
/// Todos os dados aqui são temporários e
/// apagados do estado depois do cadastro.
class NewUserViewModel {
  /// Nome do novo usuário.
  final String name;

  /// Salva o nome inserido no estado.
  final Function(String) onNameChange;

  /// Email do usuário.
  final String email;

  /// Salva o email inserido no estado.
  final Function(String) onEmailChange;

  /// Senha do usuário.
  final String password;

  /// Salva a senha temporariamente
  /// no estado.
  final Function(String) onPasswordChange;

  /// Confirmação da senha do usuário.
  final String confirmPassword;

  /// Salva a confirmação da senha
  /// temporariamente no estado.
  final Function(String) onConfirmPasswordChange;

  /// Registra o usuário.
  final Function() onRegister;

  /// Informa se o usuário está sendo
  /// registrado.
  final bool registering;

  /// Erro ao tentar registrar o
  /// usuário.
  final String? registeringError;

  /// Navega para a página dos
  /// estudantes cadastrados.
  final Function() onSelectList;

  /// Realiza o logout do usuário.
  final void Function() onExit;

  const NewUserViewModel({
    required this.name,
    required this.onNameChange,
    required this.email,
    required this.onEmailChange,
    required this.password,
    required this.onPasswordChange,
    required this.confirmPassword,
    required this.onConfirmPasswordChange,
    required this.onRegister,
    required this.registering,
    required this.registeringError,
    required this.onSelectList,
    required this.onExit,
  });

  /// Aplica os valores do estado no [NewUserViewModel].
  factory NewUserViewModel.fromStore(Store<AppState> store) {
    final state = store.state.addStudentState;

    return NewUserViewModel(
      name: state.name,
      onNameChange: (String name) => store.dispatch(NameChange(name)),
      email: state.email,
      onEmailChange: (String email) => store.dispatch(EmailChange(email)),
      password: state.password,
      onPasswordChange: (String password) =>
          store.dispatch(PasswordChange(password)),
      confirmPassword: state.confirmPassword,
      onConfirmPasswordChange: (String confirmPassword) =>
          store.dispatch(ConfirmPasswordChange(confirmPassword)),
      onRegister: () => store.dispatch(saveThunk(AddStudentServiceFirestore())),
      registering: state.registering,
      registeringError: state.registeringError,
      onSelectList: () => store.dispatch(NavigateTo('/students')),
      onExit: () => store.dispatch(logoutThunk(Services.users)),
    );
  }
}
