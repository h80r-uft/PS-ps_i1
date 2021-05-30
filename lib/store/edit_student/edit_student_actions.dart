class FirstGradeChange {
  final double firstGrade;
  FirstGradeChange(this.firstGrade);
}

class SecondGradeChange {
  final double secondGrade;
  SecondGradeChange(this.secondGrade);
}

class Saving {
  final bool saving;
  final String? savingError;
  Saving({
    required this.saving,
    this.savingError,
  });
}
