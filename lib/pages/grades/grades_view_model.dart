import 'package:ps_i1/services/services.dart';
import 'package:ps_i1/store/my_session/my_session_actions.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

import 'package:ps_i1/models/student.dart';
import 'package:ps_i1/store/app_state.dart';

/// Modelo de visualização para as notas.
class GradesViewModel {
  /// Nome do estudante.
  final String name;

  /// Primeira nota do estudante.
  final double firstGrade;

  /// Estado da primeira nota.
  late final Color firstGradeStatus;

  /// Segunda nota do estudante.
  final double secondGrade;

  /// Estado da segunda nota.
  late final Color secondGradeStatus;

  /// Média obtida pelo estudante.
  late final double average;

  /// Estado da média.
  late final Color averageStatus;

  /// Realiza o logout do usuário.
  final void Function() onExit;

  GradesViewModel({
    required this.name,
    required this.firstGrade,
    required this.secondGrade,
    required this.onExit,
  }) {
    firstGradeStatus = _getStatus(firstGrade);
    secondGradeStatus = _getStatus(secondGrade);

    average = (firstGrade + secondGrade) / 2;
    averageStatus = _getStatus(average);
  }

  /// Identifica o estado da nota baseado na média.
  Color _getStatus(double grade) {
    if (grade < 5) {
      return Colors.red;
    }
    if (grade < 7) {
      return Colors.yellow;
    }
    return Colors.green;
  }

  /// Aplica os valores do estado no [GradesViewModel].
  factory GradesViewModel.fromStore(Store<AppState> store) {
    final student = store.state.mySessionState.user as Student?;

    return GradesViewModel(
      name: student?.name.split(' ').first ?? '',
      firstGrade: student?.firstGrade ?? 0,
      secondGrade: student?.secondGrade ?? 0,
      onExit: () => store.dispatch(logoutThunk(Services.users)),
    );
  }
}
