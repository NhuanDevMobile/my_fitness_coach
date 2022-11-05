class FitnessCalculatorUtils {
  // Công thức trọng lượng cơ thể lý tưởng RobinsonEquation;
  static double getRobinsonIBM(double height, String sex) {
    double weight = 0.0;
    if (sex == "Nam") {
      weight = 52 + 1.9 * (height * 0.39370 - 60);
    } else {
      weight = 49 + 1.7 * (height * 0.39370 - 60);
    }
    return weight;
  }

  // Công thức trọng lượng cơ thể lý tưởng HamwiEquation;
  static double getHamwiIBM(double height, String sex) {
    double weight = 0.0;
    if (sex == "Nam") {
      weight = 48 + 2.7 * (height * 0.39370 - 60);
    } else {
      weight = 45.5 + 2.2 * (height * 0.39370 - 60);
    }
    return weight;
  }

  // Công thức trọng lượng cơ thể lý tưởng DevineEquation;
  static double getDevineIBM(double height, String sex) {
    double weight = 0.0;
    if (sex == "Nam") {
      weight = 50 + 2.3 * (height * 0.39370 - 60);
    } else {
      weight = 45.5 + 2.3 * (height * 0.39370 - 60);
    }
    return weight;
  }

  // Công thức trọng lượng cơ thể lý tưởng MillerEquation;
  static double getMillerIBM(double height, String sex) {
    double weight = 0.0;
    if (sex == "Nam") {
      weight = 56.2 + 1.41 * (height * 0.39370 - 60);
    } else {
      weight = 53.1 + 1.36 * (height * 0.39370 - 60);
    }
    return weight;
  }
}
