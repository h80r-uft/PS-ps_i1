import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:ps_i1/components/grade_show.dart';
import 'package:ps_i1/pages/grades/grades_view_model.dart';
import 'package:ps_i1/store/app_state.dart';

/// Página que mostra ao aluno suas notas.
class Grades extends StatelessWidget {
  const Grades({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, GradesViewModel>(
      converter: (store) => GradesViewModel.fromStore(store),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Olá, ${viewModel.name}!',
              overflow: TextOverflow.ellipsis,
            ),
            centerTitle: true,
          ),
          body: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Spacer(flex: 3),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: Grade(
                      grade: viewModel.firstGrade,
                      title: 'Nota I',
                      color: viewModel.firstGradeStatus,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: Grade(
                      grade: viewModel.secondGrade,
                      title: 'Nota II',
                      color: viewModel.secondGradeStatus,
                    ),
                  ),
                  const Spacer()
                ],
              ),
              const Spacer(),
              Flex(
                direction: Axis.horizontal,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Expanded(
                    flex: 3,
                    child: Grade(
                      grade: viewModel.average,
                      title: 'Média Final',
                      color: viewModel.averageStatus,
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  )
                ],
              ),
              const Spacer(flex: 3),
            ],
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
