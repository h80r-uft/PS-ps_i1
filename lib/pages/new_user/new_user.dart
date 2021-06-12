import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ps_i1/pages/new_user/new_user_view_model.dart';
import 'package:ps_i1/store/app_state.dart';
import 'package:ps_i1/pages/new_user/new_user_verification.dart';

/// Componente para entrada do usuário.
class MyInput extends StatelessWidget {
  /// Legenda da entrada.
  final String? label;

  /// Dica exibida quando não há texto
  final String? hint;

  /// Identifica se a entrada é uma senha.
  final bool isPassword;

  /// Armazena o inserido no estado.
  final Function(String)? onChanged;

  const MyInput({
    Key? key,
    required this.label,
    this.hint,
    this.isPassword = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
      ),
      obscureText: isPassword,
    );
  }
}

// Classe de widget que compõe o corpo da página de criar user
class NewUser extends StatelessWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NewUserViewModel>(
      converter: (store) => NewUserViewModel.fromStore(store),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cadastrar novo usuário'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: ListView(
                children: <Widget>[
                  MyInput(
                    label: 'Nome',
                    hint: 'Informe o nome',
                    isPassword: false,
                    onChanged: viewModel.onNameChange,
                  ),
                  MyInput(
                    label: 'E-Mail',
                    hint: 'Informe o e-mail',
                    isPassword: false,
                    onChanged: viewModel.onEmailChange,
                  ),
                  MyInput(
                    label: 'Senha',
                    hint: 'Informe a senha',
                    isPassword: true,
                    onChanged: viewModel.onPasswordChange,
                  ),
                  MyInput(
                    label: 'Confirmação',
                    hint: 'Confirme a senha',
                    isPassword: true,
                    onChanged: viewModel.onConfirmPasswordChange,
                  ),
                  Container(
                    height: 40.0,
                    margin: const EdgeInsets.only(top: 10.0),
                    child: OutlinedButton(
                      child: const Text(
                        'Criar cadastro',
                      ),
                      onPressed: () {
                        verify(viewModel.email, viewModel.password,
                                viewModel.confirmPassword, context)
                            ? viewModel.onRegister()
                            : null;
                      },
                    ),
                  ),
                  Container(
                    height: 40.0,
                    margin: const EdgeInsets.only(top: 10.0),
                    child: OutlinedButton(
                      child: const Text(
                        'Lista de alunos',
                      ),
                      onPressed: viewModel.onSelectList,
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: OutlinedButton(
              onPressed: viewModel.onExit,
              child: const Text('Sair'),
            ),
          ),
        );
      },
    );
  }
}
