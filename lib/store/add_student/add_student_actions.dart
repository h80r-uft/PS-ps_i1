import 'package:ps_i1/middlewares/navigation/navigation_actions.dart';
import 'package:ps_i1/models/student.dart';
import 'package:redux/redux.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'package:ps_i1/services/add_student/add_student_service.dart';

import 'package:ps_i1/store/app_state.dart';

/// Ação de atualização no nome.
///
/// Atualiza o estado de [AddStudent]
/// através do [name] armazenado.
class NameChange {
  /// Novo nome armazenado.
  final String name;
  NameChange(this.name);
}

/// Ação de atualização no email.
///
/// Atualiza o estado de [AddStudent]
/// através do [email] armazenado.
class EmailChange {
  /// Novo email armazenado.
  final String email;
  EmailChange(this.email);
}

/// Ação de atualização na senha.
///
/// Atualiza o estado de [AddStudent]
/// através da [password] armazenada.
class PasswordChange {
  /// Nova senha armazenada.
  final String password;
  PasswordChange(this.password);
}

/// Ação de atualização na confirmação de senha.
///
/// Atualiza o estado de [AddStudent]
/// através da [confirmPassword] armazenada.
class ConfirmPasswordChange {
  final String confirmPassword;
  ConfirmPasswordChange(this.confirmPassword);
}

/// Ação de limpeza do formulário.
///
/// Limpa o estado de [AddStudent].
class ClearFormData {}

/// Ação de confirmação do cadastro.
///
/// Confirma o salvamento do estudante
/// através do booleano [registering].
class Registering {
  /// Estado de salvamento.
  final bool registering;

  /// Erro obtido ao salvar.
  final String? registeringError;
  Registering({
    required this.registering,
    this.registeringError,
  });
}

void Function(Store<AppState>) saveThunk(AddStudentService addStudentService) {
  print("function registrando!");
  return (Store<AppState> store) {
    store.dispatch(Registering(registering: true));

    final state = store.state.addStudentState;

    addStudentService
        .register(state.name, state.email, state.password)
        .then((value) {
      store.dispatch(Registering(registering: false));
    }).onError((error, stackTrace) {
      store.dispatch(Registering(
        registering: false,
        registeringError: error.toString(),
      ));
    });
  };
}
