import 'package:ps_i1/models/user.dart';
import 'package:redux/redux.dart';

import '../../models/user.dart';
import '../../models/user_service.dart';
import '../app_state.dart';
//import '../../middlewares/navigation/nagivation_actions.dart';

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

void Function(Store<AppState>) saveThunk(UserService userService) {
  return (Store<AppState> store) {
    store.dispatch(Loading(loading: true));

    final user = User(
      uid: store.state.mySessionState.uid,
      name: store.state.mySessionState.name,
      isTeacher: store.state.mySessionState.isTeacher,
    );
    userService.login(email, senha).then((newNote) {
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
