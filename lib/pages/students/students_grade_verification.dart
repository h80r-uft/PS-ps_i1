/// Verifica se nota está no intervalo [0,10].
bool validGrade(double grade) {
  if (grade >= 0 && grade <= 10)
    return true;
  else
    return false;
}
