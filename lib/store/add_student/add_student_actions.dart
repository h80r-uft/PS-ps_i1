class NameChange {
  final String name;
  NameChange(this.name);
}

class EmailChange {
  final String email;
  EmailChange(this.email);
}

class PasswordChange {
  final String password;
  PasswordChange(this.password);
}

class ConfirmPasswordChange {
  final String confirmPassword;
  ConfirmPasswordChange(this.confirmPassword);
}

class ClearFormData {}

class Saving {
  final bool saving;
  final String? savingError;
  Saving({
    required this.saving,
    this.savingError,
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
