class Signal { //szum
  float signalS; // start of signal
  float signalE; // end of signal
  float avg;
  float dev;
  float[] amp = new float[1000];
  float[] time = new float[1000];

  public Signal(float signalStart, float signalEnd, float avg0, float devation1) { //konstruktor
    signalS = signalStart;
    signalE = signalEnd;
    avg = avg0;
    dev = devation1;
  }
}

class Gauss extends Signal { //szum gaussa
  public Gauss(float signalStart, float signalEnd, float avg0, float devation1) {
    super(signalStart, signalEnd, avg0, devation1);
  }
  public void calculate() {
    int j = 0;
    for (float i = signalS; i<=signalE; i+= (signalE-signalS)*0.01) {
      float first = 1/(dev*sqrt(TWO_PI));
      float third = (-1*pow((i-avg), 2))/(2*pow(dev, 2));
      float second = pow(exp(1.0), third);
      amp[j] = first*second;
      time[j] = i;
      j++;
    }
  }
}

class ContinuosSignal extends Signal {
  public ContinuosSignal(float signalStart, float signalEnd, float avg0, float devation1) {
        super(signalStart, signalEnd, avg0, devation1);
  }
}
