class Temperatura {
  double _celsius;
  Temperatura(this._celsius);

  double get fahrenheit => (_celsius * 9 / 5) + 32;

  set fahrenheit(double f) {
    _celsius = (f - 32) * 5 / 9;
  }

  double get rankine => (_celsius + 273.15) * 9 / 5;

  set rankine(double r) {
    _celsius = (r * 5 / 9) - 273.15;
  }

  double get celsius => _celsius;
}

void main() {
  Temperatura temp = Temperatura(25);
  print("Temp en Celsius: ${temp.celsius}ºC");
  print("Temp en Fahrenheit: ${temp.fahrenheit}ºF");
  print("Temp en Rankine: ${temp.rankine}ºR");
}
