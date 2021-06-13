import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:ps_i1/store/app_state.dart';
import 'package:ps_i1/pages/my_session/my_session_view_model.dart';

/// Componente para entrada do usuário.
class Input extends StatelessWidget {
  /// Identifica se a entrada é uma senha.
  final bool isPassword;

  /// Dica exibida quando não há texto
  final String hint;

  /// Componente que fica a direita da entrada.
  final Widget? suffix;

  /// Armazena o inserido no estado.
  final Function(String)? onChanged;

  const Input({
    Key? key,
    required this.hint,
    this.isPassword = false,
    this.suffix,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder();

    return Container(
      margin: const EdgeInsets.all(12),
      width: 400,
      height: 35,
      child: TextFormField(
        obscureText: isPassword,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(left: 8.0),
          border: border,
          focusedBorder: border,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black38, fontSize: 16),
          suffixIcon: suffix,
        ),
      ),
    );
  }
}

/// Página para login.
class MySession extends StatelessWidget {
  const MySession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MySessionViewModel>(
      converter: (store) => MySessionViewModel.fromStore(store),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Fazer Login'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Input(
                  hint: 'Email',
                  onChanged: viewModel.onEmailChanged,
                ),
                Input(
                  hint: 'Senha',
                  onChanged: viewModel.onPasswordChanged,
                  isPassword: viewModel.isObscured,
                  suffix: IconButton(
                    onPressed: viewModel.onObscure,
                    icon: const Icon(
                      Icons.visibility,
                      size: 18,
                      color: Colors.black45,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 400,
                  height: 40,
                  margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
                  child: OutlinedButton(
                    onPressed: viewModel.onLoad,
                    child: const Text(
                      'Entrar',
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomSheet: viewModel.loadingError is String
              ? Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 2,
                  ),
                  child: Flexible(
                    child: Text(
                      viewModel.loadingError.toString().substring(
                          viewModel.loadingError.toString().indexOf(' ') + 1),
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                )
              : null,
        );
      },
    );
  }
}
