class EquacaoPrimeiroGrau {
  double calcular(double a, double b) {
    if (a == 0) {
      throw Exception("O coeficiente 'a' não pode ser igual a zero.");
    }

    return -b / a;
  }
}
