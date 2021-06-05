import 'package:ps_i1/middlewares/navigation/navigation_actions.dart';
import 'package:redux/redux.dart';

import 'package:ps_i1/store/add_student/add_student_actions.dart';
import 'package:ps_i1/store/app_state.dart';

class NewUserViewModel {
  final String name;
  final Function(String) onNameChange;

  final String email;
  final Function(String) onEmailChange;

  final String password;
  final Function(String) onPasswordChange;

  final String confirmPassword;
  final Function(String) onConfirmPasswordChange;

  final Function() onRegister;

  final bool registering;
  final String? registeringError;

  final Function() onSelectList;

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
  });

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
      onRegister: () {},
      registering: state.registering,
      registeringError: state.registeringError,
      onSelectList: () => store.dispatch(NavigateTo('/students')),
    );
  }
}
