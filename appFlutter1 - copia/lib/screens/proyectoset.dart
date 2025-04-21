class PIDController {
  double _kp; // Ganancia Proporcional
  double _ki; // Ganancia Integral
  double _kd; // Ganancia Derivativa
  double _integral = 0; // Acumulador de la integral
  double _lastError = 0; // Último error registrado

  PIDController(this._kp, this._ki, this._kd);

  // Getters
  double get kp => _kp;
  double get ki => _ki;
  double get kd => _kd;

  // Setters con validación (evitan valores negativos)
  set kp(double value) {
    if (value >= 0) {
      _kp = value;
    } else {
      throw ArgumentError("Kp no puede ser negativo");
    }
  }

  set ki(double value) {
    if (value >= 0) {
      _ki = value;
    } else {
      throw ArgumentError("Ki no puede ser negativo");
    }
  }

  set kd(double value) {
    if (value >= 0) {
      _kd = value;
    } else {
      throw ArgumentError("Kd no puede ser negativo");
    }
  }

  // Método para calcular el ajuste basado en el error
  double calcularSalida(double error, double dt) {
    _integral += error * dt; // Acumulación del error
    double derivativo =
        (error - _lastError) / dt; // Cambio del error en el tiempo
    _lastError = error; // Guardamos el error actual

    return (_kp * error) + (_ki * _integral) + (_kd * derivativo);
  }
}

class Dron {
  double alturaDeseada; // Altura que queremos alcanzar
  double alturaActual = 0; // Altura actual del dron
  PIDController controladorPID; // Controlador PID

  Dron(this.alturaDeseada, this.controladorPID);

  // Simulación del ajuste de altura del dron con el PID
  void ajustarAltura(double dt) {
    double error = alturaDeseada - alturaActual;
    double ajuste = controladorPID.calcularSalida(error, dt);

    alturaActual += ajuste * dt;

    print(
      "Altura actual: ${alturaActual.toStringAsFixed(2)} m, Ajuste: ${ajuste.toStringAsFixed(2)}",
    );
  }
}

class Motor {
  double velocidadDeseada; // Velocidad objetivo en RPM
  double velocidadActual = 1200; // Velocidad inicial
  PIDController controladorPID; // Controlador PID

  Motor(this.velocidadDeseada, this.controladorPID);

  // Método para ajustar la velocidad del motor con PID
  void ajustarVelocidad(double dt) {
    double error = velocidadDeseada - velocidadActual;
    double ajuste = controladorPID.calcularSalida(error, dt);

    velocidadActual += ajuste * dt;

    print(
      "Velocidad actual: ${velocidadActual.toStringAsFixed(2)} RPM, Ajuste: ${ajuste.toStringAsFixed(2)}",
    );
  }
}

void main() {
  // Crear un PID con valores iniciales
  PIDController pid = PIDController(1.2, 0.4, 0.2);

  // Crear un dron con altura deseada de 10 metros
  Dron dron = Dron(10.0, pid);

  // Crear un motor con velocidad deseada de 1450 RPM
  Motor motor = Motor(1450.0, pid);

  // Simulación de 5 segundos con intervalos de 0.5s
  print("Simulación del Dron:");
  for (double t = 0; t <= 5; t += 0.5) {
    dron.ajustarAltura(0.5);
  }

  print("\nSimulación del Motor:");
  for (double t = 0; t <= 5; t += 0.5) {
    motor.ajustarVelocidad(0.5);
  }
}
