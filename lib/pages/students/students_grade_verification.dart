/// Verifica se nota está no intervalo [0,10].
bool validGrade(double? grade) {
  if (grade is! double) {
    return false;
  }
  if (grade >= 0 && grade <= 10) {
    return true;
  }
  return false;
}
