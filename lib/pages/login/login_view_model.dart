import 'package:redux/redux.dart';
import '../../../services/services.dart';
import '../../../store/app_state.dart';
import 'package:ps_i1/middlewares/navigation/navigation_actions.dart';
import '../../../store/my_session/my_session_actions.dart';

class LoginViewModel {
  final bool loading;
  final String? loadingError;
  final void Function(String, String) login1;
  final void Function() navigateToLogin;

  LoginViewModel({
    required this.login1,
    required this.navigateToLogin,
    required this.loading,
    this.loadingError,
  });

  factory LoginViewModel.fromStore(Store<AppState> store) {
    return LoginViewModel(
      loading: store.state.mySessionState.loading,
      loadingError: store.state.mySessionState.loadingError,
      login1: (String email, String password) =>
          store.dispatch(login(Services.user, "login", "senha")),
      navigateToLogin: () => store.dispatch(NavigateTo("/login")),
    );
  }
}
