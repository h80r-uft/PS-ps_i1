import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:ps_i1/components/students_item.dart';

import 'package:ps_i1/pages/students/students_view_model.dart';
import 'package:ps_i1/services/services.dart';
import 'package:ps_i1/store/app_state.dart';
import 'package:ps_i1/store/students/students_actions.dart';
import 'package:ps_i1/pages/students/students_grade_verification.dart';

/// Gera um diálogo de alerta caso a(s) nota(s) não esteja(m) no intervalo [0, 10]
createAlertDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Notas inválidas!'),
          content: Text("Elas precisam estar no intervalo [0, 10]."),
          backgroundColor: const Color(0xff731FA1),
          actions: <Widget>[
            MaterialButton(
                elevation: 5.0,
                child: const Text('Ok'),
                color: const Color(0xff291C30),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      });
}

/// Página que exibe os estudantes.
class Students extends StatelessWidget {
  const Students({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StudentsViewModel>(
      onInit: (store) => store.dispatch(loadThunk(Services.students)),
      converter: (store) => StudentsViewModel.fromStore(store),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Controle de alunos'),
            centerTitle: true,
          ),
          body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
              onTap: () => viewModel.onTapItem(index),
              title: StudentItem(
                size: MediaQuery.of(context).size,
                fullName: viewModel.students[index].name,
                status: viewModel.students[index].state,
              ),
            ),
            itemCount: viewModel.students.length,
            separatorBuilder: (context, index) => Divider(
              color: Theme.of(context).primaryColor,
              indent: 25,
              endIndent: 25,
            ),
          ),
          bottomSheet: viewModel.isEditing
              ? Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        viewModel.editedStudent!.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                      TextFormField(
                        key: Key(
                          viewModel.editedStudent!.uid +
                              viewModel.editedStudent!.firstGrade.toString() +
                              'fg',
                        ),
                        initialValue:
                            viewModel.editedStudent!.firstGrade.toString(),
                        decoration: const InputDecoration(
                          labelText: 'Nota I',
                        ),
                        onChanged: viewModel.onFirstGradeChange,
                      ),
                      TextFormField(
                        key: Key(
                          viewModel.editedStudent!.uid +
                              viewModel.editedStudent!.firstGrade.toString() +
                              'sg',
                        ),
                        initialValue:
                            viewModel.editedStudent!.secondGrade.toString(),
                        decoration: const InputDecoration(
                          labelText: 'Nota II',
                        ),
                        onChanged: viewModel.onSecondGradeChange,
                      ),
                      const Divider(
                        color: Colors.transparent,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            validGrade(double.parse(viewModel.firstGrade!)) &&
                                    validGrade(
                                        double.parse(viewModel.secondGrade!))
                                ? viewModel.onSave()
                                : createAlertDialog(context);
                          },
                          child: const Text('Salvar'),
                        ),
                      ),
                    ],
                  ),
                )
              : null,
        );
      },
    );
  }
}
