class Szum { //szum
  float signalS; // poczatek szumu
  float signalE; // koniec szumu
  float avg;
  float dev;
  float[] amplituda = new float[1000];
  float[] czas = new float[1000];

  public Szum(float signalStart, float signalEnd, float avg0, float devation1) { //konstruktor
    signalS = signalStart;
    signalE = signalEnd;
    avg = avg0;
    dev = devation1;
  }
}

class Gauss extends Szum { //szum gaussa
  public Gauss(float poczatekSzumu, float koniecSzumu, float avg0, float devation1) {
    super(poczatekSzumu, koniecSzumu, avg0, devation1);
  }
  public void calculate() {
    int j = 0;
    for (float i = signalS; i<=signalE; i+= (signalE-signalS)*0.01) {
      float pierwsze = 1/(dev*sqrt(TWO_PI));
      float trzecie = (-1*pow((i-avg), 2))/(2*pow(dev, 2));
      float drugie = pow(exp(1.0), trzecie);
      amplituda[j] = pierwsze*drugie;
      czas[j] = i;
      j++;
    }
  }
}

class ContinuosSignal extends Szum {
  public ContinuosSignal(float poczatekSzumu, float koniecSzumu, float avg0, float devation1) {
        super(poczatekSzumu, koniecSzumu, avg0, devation1);
  }
}
