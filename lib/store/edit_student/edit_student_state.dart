class EditStudentState {
  final String uid;
  final String? uidError;

  final double firstGrade;
  final String? firstGradeError;

  final double secondGrade;
  final String? secondGradeError;

  final bool saving;
  final String? savingError;

  EditStudentState({
    required this.uid,
    this.uidError,
    required this.firstGrade,
    this.firstGradeError,
    required this.secondGrade,
    this.secondGradeError,
    required this.saving,
    this.savingError,
  });

  factory EditStudentState.initial() {
    return EditStudentState(
        uid: '', firstGrade: 0.0, secondGrade: 0.0, saving: false);
  }

  EditStudentState copyWith({
    String? uid,
    String? uidError,
    double? firstGrade,
    String? firstGradeError,
    double? secondGrade,
    String? secondGradeError,
    bool? saving,
    String? savingError,
  }) {
    return EditStudentState(
        uid: uid ?? this.uid,
        uidError: uidError ?? this.uidError,
        firstGrade: firstGrade ?? this.firstGrade,
        firstGradeError: firstGradeError ?? this.firstGradeError,
        secondGrade: secondGrade ?? this.secondGrade,
        secondGradeError: secondGradeError ?? this.secondGradeError,
        saving: saving ?? this.saving,
        savingError: savingError ?? this.savingError);
  }
}
