import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:ps_i1/components/loading/loading.dart';
import '../../store/app_state.dart';
import 'login_view_model.dart';
import 'styles.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginViewModel>(
      converter: (store) => LoginViewModel.fromStore(store),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
            centerTitle: true,
          ),
          body: viewModel.loading
              ? Loading()
              : ListView(
                  children: [
                    Error(viewModel.loadingError),
                    TextInput(
                      title: "email",
                      onChanged: viewModel.onEmailChanged,
                    ),
                    TextInput(
                      title: "password",
                      onChanged: viewModel.onPasswordChanged,
                    ),
                    ElevatedButton(
                      onPressed: viewModel.onLoad,
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
