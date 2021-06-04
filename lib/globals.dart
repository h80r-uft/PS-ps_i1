import 'package:ps_i1/pages/login/login_view_model.dart';

/// O arquivo globals.dart guarda a viewModel para que a mesma
/// possa ser utilizada em várias partes do código como global

LoginViewModel viewModel = new LoginViewModel(
  uid: "",
  uidError: "",
  email: "",
  emailError: "",
  password: "",
  passwordError: "",
  isTeacher: false,
  isTeacherError: "",
  loading: false,
  loadingError: "",
);
