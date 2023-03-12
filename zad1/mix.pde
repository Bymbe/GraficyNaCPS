Signal choice(String signalForm, int amplitude) {
  switch (signalForm) {
  case "con":
    return new ContinuosSignal(0, 10, amplitude);
  case "gau":
    return new Gauss(0, 10, amplitude, 0, 1);
  case "sin1":
    return new Sinusoidal(0, 10, amplitude, 10);
  case "sin2":
    return new RectifiedOneSinusoidal(0, 10, amplitude, 10);
  case "sin3":
    return new RectifiedTwoSinusoidal(0, 10, amplitude, 10);
  case "rec1":
    return new Rectangular(0, 10, amplitude, 10, 5);
  case "rec2":
    return new SymmetricalRectangular(0, 10, amplitude, 10, 5);
  case "tri":
    return new Triangular(0, 10, amplitude, 10, 5);
  case "uni":
    return new UnitStroke(0, 10, amplitude);
  default:
    return new Signal(0, 10, amplitude);
  }
}

Signal addSignals(Signal A, Signal B, String signalForm) {
  int a = A.getAmplitude();
  int b = B.getAmplitude();
  int amplitude = a + b;
  Signal S = choice(signalForm, amplitude);
  return S;
}

Signal subSignals(Signal A, Signal B, String signalForm) {
  int a = A.getAmplitude();
  int b = B.getAmplitude();
  int amplitude = a - b;
  Signal S = choice(signalForm, amplitude);
  return S;
}

Signal mulSignals(Signal A, Signal B, String signalForm) {
  int a = A.getAmplitude();
  int b = B.getAmplitude();
  int amplitude = a * b;
  Signal S = choice(signalForm, amplitude);
  return S;
}

Signal divSignals(Signal A, Signal B, String signalForm) {
  int a = A.getAmplitude();
  int b = B.getAmplitude();
  int amplitude = a / b;
  Signal S = choice(signalForm, amplitude);
  return S;
}
