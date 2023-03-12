Signal addSignals(Signal A, Signal B) {
  int a = A.getAmplitude();
  int b = B.getAmplitude();
  int amplitude = a + b;
  return new Signal(0, 10, amplitude);
}

Signal subSignals(Signal A, Signal B) {
  int a = A.getAmplitude();
  int b = B.getAmplitude();
  int amplitude = a - b;
  return new Signal(0, 10, amplitude);
}

Signal multiSignals(Signal A, Signal B) {
  int a = A.getAmplitude();
  int b = B.getAmplitude();
  int amplitude = a * b;
  return new Signal(0, 10, amplitude);
}

Signal divSignals(Signal A, Signal B) {
  int a = A.getAmplitude();
  int b = B.getAmplitude();
  int amplitude = a / b;
  return new Signal(0, 10, amplitude);
}
