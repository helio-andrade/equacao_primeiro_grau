class Equacao {
  double calcular(double a, double b, double c) {
    if (a == 0) {
      throw Exception("O coeficiente 'a' não pode ser igual a zero.");
    }

    return -b / a;
  }
}
