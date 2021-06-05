import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

import 'package:ps_i1/models/student.dart';
import 'package:ps_i1/store/app_state.dart';

class GradesViewModel {
  final String name;

  final double firstGrade;
  late final Color firstGradeStatus;

  final double secondGrade;
  late final Color secondGradeStatus;

  late final double average;
  late final Color averageStatus;

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

  Color _getStatus(double grade) {
    if (grade < 5) {
      return Colors.red;
    }
    if (grade < 7) {
      return Colors.yellow;
    }
    return Colors.green;
  }

  factory GradesViewModel.fromStore(Store<AppState> store) {
    final student = store.state.mySessionState.user as Student;

    return GradesViewModel(
      name: student.name,
      firstGrade: student.firstGrade,
      secondGrade: student.secondGrade,
      onExit: () {},
    );
  }
}
