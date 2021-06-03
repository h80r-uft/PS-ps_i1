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

/*
void Function(Store<AppState>) saveThunk(NoteService noteService) {
  return (Store<AppState> store) {
    store.dispatch(Saving(saving: true));

    final note = Note(
      title: store.state.addNoteState.title,
      text: store.state.addNoteState.text,
    );
    noteService.add(note).then((newNote) {
      store.dispatch(ClearFormData());
      store.dispatch(Saving(saving: false));
      store.dispatch(NavigateBack());
    }).onError((error, stackTrace) {
      store.dispatch(Saving(
        saving: false,
        savingError: error.toString(),
      ));
    });
  };
}
*/
